require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  describe 'Goal#new' do 
    it 'renders the new template for goal' do 
      get :new 
      expect(response).to render_template(:new)
    end 
  end 
  
  describe 'Goal#create' do 
    context 'with correct params' do 
      it 'creates a goal' do 
        post :create, params: {goal: {body: 'goal', personal: false}}
        goal = Goal.find_by(body: 'goal')
        expect(goal).not_to be_nil
      end
      
      it 'redirect to goal page' do 
        post :create, params: {goal: {body: 'goal', personal: false}}
        goal = Goal.find_by(body: 'goal')
        expect(response).to redirect_to(goal_url(goal))
      end 
    end
    context 'without correct params' do 
      
      it 'should not create goal' do 
        post :create, params: {goal: {body: 'goal', personal: false}}
        goal = Goal.find_by(body: 'goal')
        expect(goal).to be_nil
      end 
      
      it 'generate appropriate error message' do 
        post :create, params: {goal: {body: 'goal'}}
        expect(flash[:errors]).to be_present
      end
    end 
  end 
  
  describe 'Goal#edit' do 
    it 'renders the edit template for goal' do 
      get :edit 
      expexct(response).to render_template(:edit)
    end 
  end 
    
  describe 'Goal#update' do 
    it 'updates a goal' do 
      post :create, params: {goal: {body: 'goal', personal: false}}
      goal = Goal.find_by(body: 'goal')
      patch :update, params: {id: goal.id, goal: {body: 'new_goal', personal: false}}
      goal2 = Goal.find_by(body: 'new_goal')
      expect(goal.id).to eq(goal2.id)
    end 
  end 
  
end
