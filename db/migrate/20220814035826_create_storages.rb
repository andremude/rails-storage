class CreateStorages < ActiveRecord::Migration[6.1]
  def change
    create_table :storages do |t|
      t.string :title
      t.string :description
      t.string :meters
      t.string :address
      t.string :city
      t.string :country
      t.float :latitude
      t.float :longitude
      t.integer :price
      t.string :type
      t.string :features
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
