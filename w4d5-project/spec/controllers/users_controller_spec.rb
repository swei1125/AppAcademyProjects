require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'user#new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end
  
  describe 'user#create' do 
    context 'with valid params' do
      it 'logs in user' do
        post :create, params: {user: {email: 'e', password: '123456'}}
        user = User.find_by(email: 'e')
        expect(session[:session_token]).to eq(user.session_token)
      end
      
      it 'redirects to show page' do
        post :create, params: {user: {email: 'e', password: '123456'}}
        user = User.find_by(email: 'e')
        expect(response).to redirect_to(user_url(user))
      end
    end
    
    context 'without valid params' do
      it 'should render new sign up page' do
        post :create, params: {user: {email: 'e', password: '123'}}
        expect(response).to redirect_to(new_user_url)
      end
      
      it 'should have appropriate errors' do
        post :create, params: {user: {email: 'e', password: '123'}}
        expect(flash[:errors]).to be_present
      end
    end
  end
end
