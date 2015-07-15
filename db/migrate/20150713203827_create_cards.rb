class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :number
      t.string :type
      t.integer :exp_year
      t.integer :exp_month
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
