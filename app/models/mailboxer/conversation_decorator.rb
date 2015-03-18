Mailboxer::Conversation.class_eval do
  has_one :info, class_name: 'Spree::ConversationInfo'
  def each_other(user)
    self.recipients.each do |recipient|
      if user != recipient
        return recipient
      end
    end
  end
end