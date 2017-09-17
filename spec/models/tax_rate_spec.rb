require 'rails_helper'

RSpec.describe TaxRate, type: :model do
  describe 'Associations' do
    it { should belong_to(:nation) }
    it { should have_many(:tax_ranges) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:nation_id) }
    it { should validate_uniqueness_of(:start_date).scoped_to(:nation_id) }
    it { should validate_presence_of(:end_date) }
    it { should validate_uniqueness_of(:end_date).scoped_to(:nation_id) }
  end
end
