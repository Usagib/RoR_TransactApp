require('rails_helper')
require('database_cleaner/active_record')

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.start
RSpec.feature('Groups', type: :feature) do
  before(:each) do
    DatabaseCleaner.clean
    visit users_new_path
    within('form') do
      fill_in 'Name', with: 'Eduardo'
      fill_in 'Email', with: 'EduardoTest1@test.com'
      fill_in 'Password', with: '123456'
      fill_in 'Confirmation', with: '123456'
    end
    click_button 'createuser'
  end

  context 'create groups' do
    scenario 'should create new group' do
      visit new_group_path
      within('form') do
        fill_in 'Name', with: 'Test group'
        attach_file 'spec/files/barcode.png'
      end
      click_button 'create group'
      expect(page).to(have_content('Test group', 'All Groups'))
    end
  end
end
