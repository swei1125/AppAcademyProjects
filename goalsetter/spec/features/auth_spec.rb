require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  background :each do 
    visit new_user_url 
  end 
  scenario 'has a new user page' do
    expect(page).to have_content("Sign Up") 
  end 

  feature 'signing up a user' do

    scenario 'shows email on the homepage after signup' do 
      fill_in 'Email', with: 'e'
      fill_in 'Paasword', with: '123456'
      click_button 'Create User'
      expect(page).to have_content('e')
    end 
  end
end

feature 'logging in' do
  scenario 'shows email on the homepage after login' do 
    fill_in 'Email', with: 'e'
    fill_in 'Paasword', with: '123456'
    click_button 'Create User'
    visit new_user_url
    expect(page).to have_content('e')
  end 

end

feature 'logging out' do
  scenario 'begins with a logged out state' do
    expect(session[session_token]).to be_nil
  end 

  scenario 'doesn\'t show email on the homepage after logout' do 
    expect(page).not_to have_content('e')
  end 

end