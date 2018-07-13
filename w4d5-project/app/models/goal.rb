# == Schema Information
#
# Table name: goals
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer          not null
#  body       :text             not null
#  personal   :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Goal < ApplicationRecord
  validates :user_id, :body, :personal, presence: true 
  
  belongs_to :user
end
