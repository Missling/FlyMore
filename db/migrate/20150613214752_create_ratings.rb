class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :value
      t.integer :user_type #1 for driver, 2 for passenger
      t.text :comment
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
