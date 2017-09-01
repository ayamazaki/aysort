class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :value1
      t.string :value2
      t.string :value3

      t.timestamps
    end
  end
end
