class CreateCommunes < ActiveRecord::Migration[5.2]
  def change
    create_table :communes do |t|
      t.string :dep
      t.string :depcom
      t.string :commune
      t.string :geo_centre
      t.integer :geo_surface
      t.string :geo_contour

      t.timestamps
    end
  end
end
