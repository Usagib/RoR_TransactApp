require('rails_helper')
require('database_cleaner/active_record')

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.start
RSpec.feature('transactions', type: :feature) do
  before(:each) do
    DatabaseCleaner.clean
    visit users_new_path
    within('form') do
      fill_in 'Name', with: 'Eduardo'
      fill_in 'Email', with: 'EduardoTest1@test.com'
      fill_in 'Password', with: '123456'
      fill_in 'Confirmation', with: '123456'
    end
    click_button 'Sign Up'
    visit new_group_path
    within('form') do
      fill_in 'Name', with: 'Test group'
      attach_file 'spec/files/barcode.png'
    end
    click_button 'Create Group'
  end

  context 'create transaction' do
    scenario 'should not create new transaction' do
      visit new_mytransaction_path
      within('form') do
        fill_in 'Amount', with: 1234
      end
      click_button 'Create Transaction'
      expect(page).to(have_content('Name can\'t be blank'))
    end
  end
end
