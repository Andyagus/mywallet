class CreateUserwallets < ActiveRecord::Migration
  def change
    create_table :userwallets do |t|

      t.timestamps null: false
    end
  end
end
