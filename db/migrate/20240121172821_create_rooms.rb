class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :serialnumber
      t.string :user_email
      t.string :family_email
      t.integer :allert_count

      t.timestamps
    end
  end
end
