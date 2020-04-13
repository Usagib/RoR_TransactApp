require('rails_helper')

RSpec.describe(User, type: :model) do
  context 'ActiveRecord Associations' do
    it { should have_many(:mytransactions) }
    it { should have_many(:groups) }
  end

  context 'Model Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(255) }
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:email).is_at_most(255) }
    it { should validate_length_of(:email).is_at_least(10) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_most(255) }
    it { should validate_length_of(:password).is_at_least(6) }
  end
end
