class CreateMicroposts < ActiveRecord::Migration[5.1]
  def change
    create_table :microposts do |t|
      t.string :question
      t.string :answer
      t.string :value1
      t.string :value2
      t.string :value3
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
