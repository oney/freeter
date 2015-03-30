class AddShipmentToConversationInfos < ActiveRecord::Migration
  def change
    add_column :spree_conversation_infos, :shipment_id, :integer, index: true
  end
end
