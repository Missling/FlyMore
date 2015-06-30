class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :profile_picture
      t.text :introduction
      t.string :contact_info
      t.string :username
      t.string :password_hash

      t.timestamps null: false
    end
  end
end
