Spree::Shipment.class_eval do
  has_one :conversation_info
  after_create :create_conversation

  def create_conversation
    supplier_user = self.supplier.users.first
    user = self.order.user
    receipt = user.send_message(supplier_user, "first", "subject")
    conversation = receipt.conversation
    info = Spree::ConversationInfo.create
    info.shipment = self
    conversation.info = info
    conversation.save
  end
end