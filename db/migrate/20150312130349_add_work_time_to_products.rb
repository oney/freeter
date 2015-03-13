class AddWorkTimeToProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :work_time, :integer
  end
end
