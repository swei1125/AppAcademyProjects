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

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password) }
  end


  describe 'class methods' do
    describe '#is_password?' do
      user = User.new(email: '123@email.com')
      user.password = '123456'
      it "should set user's password_digest" do
        # expect(user.password_digest).not_be nil
      end
    end
    describe '#ensure_session_token' do
    end

    describe '#reset_session_token' do
    end

    describe '::find_by_credentials' do
    end


  end
end
