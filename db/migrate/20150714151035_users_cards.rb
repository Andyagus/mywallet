class UsersCards < ActiveRecord::Migration
  def change
      create_table :users_cards do |t|
      t.integer :user_id
      t.integer :card_id 
      t.timestamps null: false
   end
  end
end
