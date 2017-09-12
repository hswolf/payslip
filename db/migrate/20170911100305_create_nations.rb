class CreateNations < ActiveRecord::Migration[5.1]
  def change
    create_table :nations do |t|
      t.string :code, null: false, index: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
