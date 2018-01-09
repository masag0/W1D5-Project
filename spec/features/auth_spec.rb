require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  let(:user) { FactoryBot.build(:user) }
  before(:each) do
    sign_up_as(user)
  end

  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content("New User")
  end

  feature 'signing up a user' do

    scenario 'shows username on the homepage after signup' do
      expect(page).to have_content(user.username)
    end

  end
end

feature 'logging in' do
  let(:user) { FactoryBot.build(:user) }
  before(:each) do
    sign_up_as(user)
  end

  scenario 'shows username on the homepage after login' do
    login_as(user)
    expect(page).to have_content("Welcome #{user.username}")
    expect(page).to have_current_path(users_url)
  end

end

feature 'logging out' do
  let!(:user) { FactoryBot.create(:user) }

  scenario 'begins with a logged out state' do
    visit root_url
    expect(page).to have_button "Log In"
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    login_as(user)
    click_on("Log Out")
    expect(page).not_to have_content("Welcome #{user.username}")
  end

end
