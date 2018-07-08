# == Schema Information
#
# Table name: questions
#
#  id         :bigint(8)        not null, primary key
#  body       :text             not null
#  poll_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  validates :body, :poll_id, presence: true

  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :AnswerChoice

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll

  has_many :responses,
    through: :answer_choices,
    source: :reponses

  def results
    choices_count = self
      .answer_choices
      .select('answer_choices.*, count(responses.id) as reponses_count')
      .left_outer_joins(:responses)
      .group('answer_choices.id')

    result = {}
    choices_count.each do |choice|
      result[choice.body] = choice.responses_count
    end
    result
  end
end
