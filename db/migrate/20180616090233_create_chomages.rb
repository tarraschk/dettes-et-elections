class CreateChomages < ActiveRecord::Migration[5.2]
  def change
    create_table :chomages do |t|
      t.integer :year
      t.integer :taux
      t.references :commune, foreign_key: true

      t.timestamps
    end
  end
end
