class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.integer :sensor_id
      t.string :value
      t.timestamps
    end

    add_index :readings, :sensor_id
  end
end
