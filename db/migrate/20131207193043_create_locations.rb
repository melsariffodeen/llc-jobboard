class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|

      t.string :address
      t.string :address2
      t.string :city
      t.string :province
      t.string :country
      t.string :postal_code

      t.decimal :latitude, :precision => 10, :scale => 6
      t.decimal :longitude, :precision => 10, :scale => 6

      t.timestamps
    end
  end
end
