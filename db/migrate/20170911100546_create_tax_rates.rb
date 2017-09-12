class CreateTaxRates < ActiveRecord::Migration[5.1]
  def change
    create_table :tax_rates do |t|
      t.date :start_date, null: false, index: true
      t.date :end_date, null: false, index: true
      t.string :formula, default: 'default'
      t.references :nation, foreign_key: true

      t.timestamps
    end
  end
end
