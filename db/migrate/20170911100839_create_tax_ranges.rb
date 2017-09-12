class CreateTaxRanges < ActiveRecord::Migration[5.1]
  def change
    create_table :tax_ranges do |t|
      t.string :start_range, null: false, index: true
      t.string :end_range, null: false, default: '', index: true
      t.string :plus, default: '0'
      t.string :rate, default: '0'
      t.references :tax_rate, foreign_key: true

      t.timestamps
    end
  end
end
