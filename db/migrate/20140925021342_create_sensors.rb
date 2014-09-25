class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.string :type
      t.string :name
      t.timestamps
    end

    add_index :sensors, [:type, :name], unique: true
  end
end
