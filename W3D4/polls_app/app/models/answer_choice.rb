# == Schema Information
#
# Table name: answer_choices
#
#  id          :bigint(8)        not null, primary key
#  question_id :integer          not null
#  user_id     :integer          not null
#  body        :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#



class AnswerChoice < ApplicationRecord
  validates :question_id, :user_id, :body, presence: true
  belongs_to :question,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :Question 
    
  has_many :reponses,
    primary_key: :id, 
    foreign_key: :answer_choice_id,
    class_name: :Response 
end 
