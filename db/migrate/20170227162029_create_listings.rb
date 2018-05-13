class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.string :img_url
      t.string :make
      t.string :model
      t.decimal :mpg
      t.decimal :price
      t.date :registered

      t.timestamps null: false
    end
  end
end
