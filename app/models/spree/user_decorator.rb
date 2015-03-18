Spree::User.class_eval do
  has_many :tasks
  acts_as_messageable
  def mailboxer_name
    self.name
  end
  def mailboxer_email(object)
    self.email
  end
  def name
  	self.supplier.name
  end
end