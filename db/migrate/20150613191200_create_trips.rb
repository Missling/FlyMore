class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.belongs_to :user
      t.string :origin
      t.string :destination
      t.string :price
      t.integer :seats
      t.string :car_photo
      t.string :time
      t.string :date

      t.timestamps null: false
    end
  end
end
