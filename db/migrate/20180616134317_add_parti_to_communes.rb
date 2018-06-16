class AddPartiToCommunes < ActiveRecord::Migration[5.2]
  def change
    add_column :communes, :parti_2014, :string
  end
end
