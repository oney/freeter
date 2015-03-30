module Spree
  class ConversationInfo < Spree::Base
  	belongs_to :conversation, class_name: 'Mailboxer::Conversation'
    belongs_to :product
    belongs_to :task
    belongs_to :shipment
  end
end