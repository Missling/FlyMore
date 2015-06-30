class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.belongs_to :trip
      t.belongs_to :user
      
      t.timestamps null: false
    end
  end
end
