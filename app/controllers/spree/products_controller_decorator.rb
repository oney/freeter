Spree::ProductsController.class_eval do
  before_action :load_product, only: [:show, :inquiry, :inquiry_create]
  before_action :setup_supplier, :only => [:show]

  def inquiry
  end

  def inquiry_create
    supplier = @product.master.suppliers.first
    supplier_user = supplier.users.first

    receipt = spree_current_user.send_message(supplier_user, params[:body], "inquiry product")

    conversation = receipt.conversation
    conversation.create_info
    conversation.info.product = @product
    conversation.info.state = 1
    conversation.info.save
    redirect_to conversation_path(conversation)
  end
private
  def setup_supplier
    @supplier = @product.suppliers.first
  end
end