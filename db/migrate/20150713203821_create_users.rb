class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :index
      t.string :email
      t.string :phone
      t.string :fname
      t.string :lname
      t.decimal :balance
      t.string :password
      t.timestamps null: false
    end
  end
end
