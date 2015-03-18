class Spree::SuppliersController < Spree::StoreController
  before_action :load_supplier, only: :show

  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  respond_to :html

  def index
    # @searcher = build_searcher(params.merge(include_images: true))
    # @products = @searcher.retrieve_products
    # @taxonomies = Spree::Taxonomy.includes(root: :children)
  end

  def show
    @products = @supplier.products
  end

  private
    def accurate_title
      if @product
        @product.meta_title.blank? ? @product.name : @product.meta_title
      else
        super
      end
    end

    def load_supplier
      @supplier = Spree::Supplier.find(params[:id])
    end

end
