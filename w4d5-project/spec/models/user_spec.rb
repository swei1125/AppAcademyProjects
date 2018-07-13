# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email           :string           not null
#  session_token   :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'
require 'shoulda-matchers'

RSpec.describe User, type: :model do
  describe 'validations' do 
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:session_token)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_length_of(:password).is_at_least(6)}
    
  end
    
  describe 'methods' do
    describe "user#ensure_session_token" do
      it "ensure session token not nil" do 
        user = User.create(email: 'e', password: '123456')
        expect(user.session_token).not_to be_nil
      end 
    end 
    
    describe "user#reset_session_token" do 
      it "changes user's session token" do 
        user = User.create(email: 'e', password: '123456')
        session = user.session_token
        user.reset_session_token
        expect(session).not_to eq(user.session_token)
      end 
    end
    
    describe 'user#password=' do
      it 'should setup user\'s password_digest' do
        user = User.create(email: 'e', password: '123456')
        expect(user.password_digest).not_to be_nil
      end
    end
    
    describe 'user::find_by_credentials' do
      it 'finds the user with correct email and password' do
        user1 = User.create(email: 'e', password: '123456')
        user2 = User.find_by_credentials('e', '123456')
        expect(user1).to eq(user2)
      end
    end
  end
end
