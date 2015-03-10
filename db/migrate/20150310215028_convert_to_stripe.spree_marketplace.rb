# This migration comes from spree_marketplace (originally 20131209022116)
class ConvertToStripe < ActiveRecord::Migration
  def change
    add_column :spree_supplier_bank_accounts, :country_iso, :integer
    add_column :spree_supplier_bank_accounts, :name, :string
  end
end
