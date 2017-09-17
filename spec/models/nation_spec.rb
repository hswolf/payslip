require 'rails_helper'

RSpec.describe Nation, type: :model do
  describe 'Associations' do
    it { should have_many(:tax_rates) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:code) }
    it { should validate_uniqueness_of(:code) }
  end
end
