require 'rails_helper'

RSpec.describe MyTransaction, type: :model do
  context 'ActiveRecord Associations' do
    it { should belong_to(:user) }
    it { should have_many(:groups) }
  end

  context 'Model Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:amount) }
    it { should validate_length_of(:name).is_at_most(255) }
  end
end
