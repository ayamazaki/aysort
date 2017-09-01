class CreateUs < ActiveRecord::Migration[5.1]
  def change
    create_table :us do |t|
      t.string :name
      t.integer :age
      t.integer :gender
      t.date :birthday
      t.string :hometown
      t.text :remarks

      t.timestamps
    end
  end
end
