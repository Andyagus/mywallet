class AddBalanceToCard < ActiveRecord::Migration
  def change
   add_column :cards, :balance, :decimal   
  end
end
