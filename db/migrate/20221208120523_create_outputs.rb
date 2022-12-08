class CreateOutputs < ActiveRecord::Migration[7.0]
  def change
    create_table :outputs do |t|
      t.integer :turbine_id
      t.float :speed
      t.float :production
      t.timestamps
    end
  end
end
