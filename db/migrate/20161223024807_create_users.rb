class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.timestamps null: false
      t.string :name
      t.string :email, null: false
      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128
      t.string :gender
      t.integer :phone_num
      t.date :dob
    end

    add_index :users, :email
    add_index :users, :remember_token

  end
end
