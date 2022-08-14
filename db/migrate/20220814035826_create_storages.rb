class CreateStorages < ActiveRecord::Migration[6.1]
  def change
    create_table :storages do |t|
      t.string :title
      t.string :meters
      t.string :address
      t.string :city
      t.float :latitude
      t.float :longitude
      t.string :price

      t.timestamps
    end
  end
end
