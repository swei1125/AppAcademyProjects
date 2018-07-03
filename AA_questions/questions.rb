require 'sqlite3'
require 'singleton'


class QuestionsDBConnection < SQLite3::Database
  include Singleton
  
  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end



class Question
  
  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end
  
  def self.find_by_author_id(author_id)
    questions = QuestionsDBConnection.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL
    questions.map { |q| Question.new(q) }
  end
  
  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end
  
  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end
  
  def author
    QuestionsDBConnection.instance.execute(<<-SQL, @author_id)
      SELECT
        fname, lname
      FROM
        users
      WHERE
        users.id = ?
    SQL
  end
  
  def replies
    Reply.find_by_question_id(@id)
  end
  
  def followers
    QuestionFollow.followers_for_question_id(@id)
  end
  
  def likers 
    QuestionLike.likers_for_question_id(@id) 
  end
  
  def num_likes 
    QuestionLike.num_likes_for_question_id(@id)
  end

end



class Reply  
  def self.find_by_user_id(user_id)
    replies = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM 
        replies 
      WHERE 
        author_id = ? 
    SQL
    
    replies.map {|r| Reply.new(r)}
  end
  
  def self.find_by_question_id(question_id)
    replies = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM 
        replies 
      WHERE 
        question_id = ?
    SQL
    replies.map {|r| Reply.new(r)}
  end
  
  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @author_id = options['author_id']
    @parent_id = options['parent_id']
    @body = options['body']
  end
  
  def author
    QuestionsDBConnection.instance.execute(<<-SQL, @author_id)
      SELECT
        fname, lname
      FROM 
        users
      WHERE 
        users.id = ?
    SQL
  end
  
  def question
    QuestionsDBConnection.instance.execute(<<-SQL, @question_id)
      SELECT
        *
      FROM 
        questions
      WHERE 
        questions.id = ?
    SQL
  end
  
  def parent_reply
    QuestionsDBConnection.instance.execute(<<-SQL, @parent_id)
      SELECT
        *
      FROM 
        replies 
      WHERE 
        id = ?
    SQL
  end
  def child_reply
    QuestionsDBConnection.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM 
        replies 
      WHERE 
        parent_id = ?
    SQL
  end
end



class User 
  def self.find_by_name(fname, lname)
    users = QuestionsDBConnection.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM 
        users
      WHERE 
        fname = ? AND lname = ?
    SQL
    users.map {|u| User.new(u)}
  end
  
  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end
  
  def authored_questions
    Question.find_by_author_id(@id)
  end
  
  def authored_replies
    Reply.find_by_user_id(@id)
  end
  
  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end
  
  def liked_questions 
    QuestionLike.liked_questions_for_user_id(@id)
  end
  
  def average_karma
    QuestionsDBConnection.instance.execute(<<-SQL, @id)
      SELECT 
        question_id 
      FROM
        question_likes
      GROUP BY 
        question_id 
      ORDER BY 
        COUNT(user_id)
    
  end
end 

class QuestionFollow
  def self.followers_for_question_id(question_id)
    followers = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        id, fname, lname
      FROM
        users
      JOIN question_follows
        ON question_follows.user_id = users.id
      WHERE
        question_id = ?
      SQL
    followers.map { |u| User.new(u)}
  end
  
  def self.followed_questions_for_user_id(user_id)
    questions = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN question_follows
        ON question_follows.question_id = questions.id
      WHERE
        user_id = ?
    SQL
    questions.map { |q| Question.new(q) }
  end
  
  def self.most_followed_questions(n)
    questions = QuestionsDBConnection.instance.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        questions
      JOIN question_follows
        ON question_follows.question_id = questions.id 
      GROUP BY 
        questions.id
      ORDER BY
        COUNT(*) DESC
      LIMIT 
        ?
    SQL
    questions.map {|q| Question.new(q)}
  end
end 



class QuestionLike 
  def self.likers_for_question_id(question_id)
    users = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT 
        *
      FROM
        users 
      WHERE 
        id IN (
          SELECT 
            user_id 
          FROM 
            question_likes
          WHERE 
            question_id = ?
        )
        SQL
    users.map {|u| User.new(u)}
  end
  
  def self.num_likes_for_question_id(question_id)
    counts = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(*) AS like_count
      FROM
        users
      WHERE
        id IN (
          SELECT 
            user_id 
          FROM 
            question_likes
          WHERE 
            question_id = ?
        )
        SQL
        counts.first.values.first
  end
  
  def self.liked_questions_for_user_id(user_id)
    questions = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        questions
      WHERE
        id IN (
          SELECT 
            question_id
          FROM
            question_likes
          WHERE
            user_id = ?
        )
        SQL
      questions.map { |q| Question.new(q) }
  end
  
  def self.most_liked_questions(n)
    questions = QuestionsDBConnection.instance.execute(<<-SQL, n)
      SELECT
        *
      FROM
        questions 
      WHERE 
        id IN (
          SELECT 
            question_id  
          FROM 
            question_likes
          GROUP BY 
            question_id 
          ORDER BY 
            COUNT(*) DESC
          LIMIT
            ?
        )
        SQL
    
    questions.map {|q| Question.new(q)}
  end
end 



