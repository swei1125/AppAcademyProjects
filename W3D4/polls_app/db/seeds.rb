# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Poll.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
Response.destroy_all

user1 = User.create(username: 'User1')
user2 = User.create(username: 'User2')
user3 = User.create(username: 'User3')
user4 = User.create(username: 'User4')
user5 = User.create(username: 'User5')

poll1 = Poll.create(title: 'Poll1', author_id: user1.id)
poll2 = Poll.create(title: 'Poll2', author_id: user2.id)
poll3 = Poll.create(title: 'Poll3', author_id: user3.id)

question1 = Question.create(body: 'Q1', poll_id: poll1.id)
question2 = Question.create(body: 'Q2', poll_id: poll1.id)
question3 = Question.create(body: 'Q3', poll_id: poll2.id)
question4 = Question.create(body: 'Q4', poll_id: poll2.id)
question5 = Question.create(body: 'Q5', poll_id: poll3.id)
question6 = Question.create(body: 'Q6', poll_id: poll3.id)

choice1 = AnswerChoice.create(question_id: question1.id, user_id: user1.id, body: 'Choice1')
choice2 = AnswerChoice.create(question_id: question2.id, user_id: user1.id, body: 'Choice2')
choice3 = AnswerChoice.create(question_id: question3.id, user_id: user2.id, body: 'Choice3')
choice4 = AnswerChoice.create(question_id: question4.id, user_id: user2.id, body: 'Choice4')
choice5 = AnswerChoice.create(question_id: question5.id, user_id: user3.id, body: 'Choice5')
choice6 = AnswerChoice.create(question_id: question6.id, user_id: user5.id, body: 'Choice6')
choice7 = AnswerChoice.create(question_id: question1.id, user_id: user4.id, body: 'Choice7')

reponse1 = Response.create(user_id: user1.id, answer_choice_id: choice1.id)
reponse2 = Response.create(user_id: user1.id, answer_choice_id: choice2.id)
reponse3 = Response.create(user_id: user2.id, answer_choice_id: choice3.id)
reponse4 = Response.create(user_id: user3.id, answer_choice_id: choice4.id)
reponse5 = Response.create(user_id: user4.id, answer_choice_id: choice5.id)



