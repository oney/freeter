class CreateConversationInfos < ActiveRecord::Migration
  def change
    create_table :spree_conversation_infos do |t|
      t.references :conversation, index: true
      t.references :product, index: true
      t.references :task, index: true
      t.integer :state, index: true
      t.timestamps
    end
  end
end
