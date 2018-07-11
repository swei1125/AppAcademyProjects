# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  birth_date  :date             not null
#  color       :string
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  validates :birth_date, presence: true
  validates :name, presence: true, uniqueness: true
  validates :color, presence: true, inclusion: { in: %w(black white green), message: "%{value} is not a valid color" }
  validates :sex, presence: true, inclusion: { in: %w(M F), message: "%{value} is not a valid sex"}
  
  def age 
    age = Date.today.year - birth_date.year
    age -= 1 if Date.today < birth_date + age.years
    age 
  end
  
  COLORS = %w(black white green)
end 
