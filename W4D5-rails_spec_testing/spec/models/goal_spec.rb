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

require 'rails_helper'

RSpec.describe Goal, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:user_id)}
    it {should validate_presence_of(:body)}
    it {should validate_presence_of(:personal)}
  end
  
  describe 'associations' do
    it {should belong_to(:user)}
  end
end
