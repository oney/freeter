Spree::ProductsController.class_eval do
  before_action :setup_supplier, :only => [:show]

private
  def setup_supplier
    @supplier = @product.suppliers.first
  end
end