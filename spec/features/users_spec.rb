require 'rails_helper'

# rubocop: disable Metrics/BlockLength
RSpec.feature 'Users', type: :feature do
  before(:each) do
    @testuser1 = User.create(name: 'User_sending', email: 'sender@user.com', password: '123456')
  end

  context 'create new user, signup' do
    scenario 'should create new user' do
      DatabaseCleaner.clean
      visit users_new_path
      within('form') do
        fill_in 'Name', with: 'Eduardo'
        fill_in 'Email', with: 'EduardoTest1@test.com'
        fill_in 'Password', with: '123456'
        fill_in 'Confirmation', with: '123456'
      end
      click_button 'createuser'
      expect(page).to have_content('Eduardo')
    end

    scenario 'should not create new user' do
      DatabaseCleaner.clean
      visit users_new_path
      within('form') do
        fill_in 'Name', with: 'Eduardo'
        fill_in 'Email', with: 'EduardoTest12@test.com'
        fill_in 'Password', with: '123456'
        fill_in 'Confirmation', with: '1234567'
      end
      click_button 'createuser'
      expect(page).to have_content('Password confirmation doesn\'t match')
    end
  end

  context 'sign in user' do
    scenario 'should sign in' do
      visit new_user_session_path
      within('form') do
        fill_in 'Email', with: 'sender@user.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
      expect(page).to have_content('Signed in successfully')
    end

    scenario 'should not sign in' do
      visit new_user_session_path
      within('form') do
        fill_in 'Email', with: 'sender@user.com'
        fill_in 'Password', with: '1234567'
      end
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end
  end
end
