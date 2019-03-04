class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :name, null: false, unique: true
      t.string :number, null: false, unique: true

      t.timestamps
    end
  end
end
