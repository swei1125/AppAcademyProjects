# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'
require 'shoulda-matchers'
RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
  end


  describe 'class methods' do
    subject(:user) do
      FactoryBot.build(:user, email: 'abc@email.com', password: '123456')
    end

    describe '#is_password?' do
      it "should set user's password_digest" do
        expect(user.password_digest).to_not be_nil
      end
    end

    describe '#reset_session_token' do
      it "should reset user's session_token" do
        old_session_token = user.session_token
        user.reset_session_token!
        expect(user.session_token).to_not eq(old_session_token)
      end
    end

  end
end
