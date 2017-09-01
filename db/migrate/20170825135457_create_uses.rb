class CreateUses < ActiveRecord::Migration[5.1]
  def change
    create_table :uses do |t|
    	t.string :name
  t.integer :gender
  t.date :birthday
  t.string :hometown
  t.text :remarks

      t.timestamps
    end
  end
end
