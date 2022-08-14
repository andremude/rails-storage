class CreateStorages < ActiveRecord::Migration[6.1]
  def change
    create_table :storages do |t|
      t.string :title
      t.string :description
      t.string :meters
      t.string :address
      t.string :city
      t.float :latitude
      t.float :longitude
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
