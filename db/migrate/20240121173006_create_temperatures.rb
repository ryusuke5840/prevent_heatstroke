class CreateTemperatures < ActiveRecord::Migration[7.0]
  def change
    create_table :temperatures do |t|
      t.float :temperature
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
