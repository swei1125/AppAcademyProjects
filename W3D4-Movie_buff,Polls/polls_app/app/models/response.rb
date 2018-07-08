# == Schema Information
#
# Table name: responses
#
#  id               :bigint(8)        not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord
  validates :user_id, :answer_choice_id, presence: true
  validate :respondent_already_answered?
  validate :respondent_is_author?
  
  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    self.question.responses.where.not(responses: {id: self.id})
    # ('responses.id = (?)', self.id)
  end

  def respondent_already_answered?
    sibling_ids = sibling_responses.pluck(:user_id)
    if sibling_ids.include?(self.respondent.id)
      errors[:Respondent] << "already answered"
    end
  end

  def respondent_is_author?
    if user_id == question.poll.author_id
      errors[:Author] << 'cannot respond'
    end
  end
end
