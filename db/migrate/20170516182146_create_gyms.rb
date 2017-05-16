class CreateGyms < ActiveRecord::Migration[5.0]
  def change
    create_table :gyms do |t|
      t.string :name
      t.string :address
      t.string :bio
      t.integer :fee

      t.timestamps
    end
  end
end
