class ChangeWorkTimeOfProducts < ActiveRecord::Migration
  def up
    change_column :spree_products, :work_time, :integer, default: 5
  end
  def down
    change_column :spree_products, :work_time, :integer
  end
end
