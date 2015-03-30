class CreateUsedBalances < ActiveRecord::Migration
  def change
    create_table :spree_used_balances do |t|
      t.references :user, index: true
      t.references :payment_method, index: true
      t.integer    :amount, default: 0, null: false
      t.integer    :number, default: 0, null: false
      t.boolean    :success, default: false
    end
  end
end
