class Nation < ApplicationRecord
  has_many :tax_rates, dependent: :destroy

  validates_uniqueness_of :code
end
