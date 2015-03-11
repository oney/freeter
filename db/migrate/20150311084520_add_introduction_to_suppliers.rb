class AddIntroductionToSuppliers < ActiveRecord::Migration
  def change
    add_column :spree_suppliers, :introduction, :string
  end
end
