class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.date :released
      t.integer :gender
  t.date :birthday
  t.string :hometown
  t.text :remarks

      t.timestamps
    end
  end
end
