Spree::Supplier.class_eval do
  has_one :image, -> { order(:position) }, as: :viewable, dependent: :destroy, class_name: "Spree::Image"
end