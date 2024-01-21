class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.string :serialnumber, null: false
      t.string :user_email, null: false
      t.string :family_email, null: false
      t.integer :allert_count, null: false , default: 0

      t.timestamps
    end
  end
end
