class Nation < ApplicationRecord
  has_many :tax_rates, dependent: :destroy

  validates :code, presence: true, uniqueness: true
end
