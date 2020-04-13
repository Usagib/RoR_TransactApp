require('rails_helper')
require('database_cleaner/active_record')

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.start
RSpec.feature('Users', type: :feature) do
  before(:each) do
    DatabaseCleaner.clean
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
      expect(page).to(have_content('Eduardo'))
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
      expect(page).to(have_content('Password confirmation doesn\'t match'))
    end
  end
end
