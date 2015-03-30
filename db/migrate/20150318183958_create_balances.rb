class CreateBalances < ActiveRecord::Migration
  def change
    create_table :spree_balances do |t|
      t.references :user, index: true
      t.integer    :amount, default: 0, null: false
      t.integer    :total, default: 0, null: false
      t.string     :billing
      t.integer    :state
      t.timestamps
    end
  end
end
