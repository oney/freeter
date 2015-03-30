Spree::User.class_eval do
  has_many :tasks
  has_many :balances
  after_create :create_supplier

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

  def create_supplier
    supplier = Spree::Supplier.new
    supplier.email = self.email
    supplier.first_name = 'not_set'
    supplier.name = 'not_set'
    supplier.last_name = 'not_set'
    supplier.save
  end
end