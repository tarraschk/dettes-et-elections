class AddIsActiveToCommunes < ActiveRecord::Migration[5.2]
  def change
    add_column :communes, :is_active, :boolean, default: true
  end
end
