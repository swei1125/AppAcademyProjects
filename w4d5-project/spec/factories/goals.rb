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

FactoryBot.define do
  factory :goal do
    user_id 1
    body "MyText"
    personal false
  end
end
