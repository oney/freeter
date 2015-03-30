class AddBalanceToUsers < ActiveRecord::Migration
  def change
    add_column :spree_users, :balance, :integer, default: 0
  end
end
