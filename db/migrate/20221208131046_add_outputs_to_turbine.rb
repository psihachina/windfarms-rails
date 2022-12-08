class AddOutputsToTurbine < ActiveRecord::Migration[7.0]
  def change
    add_column :turbines, :user_id, :integer
  end
end
