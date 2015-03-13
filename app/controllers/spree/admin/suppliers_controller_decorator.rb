Spree::Admin::SuppliersController.class_eval do

  update.before :set_viewable

  def set_viewable
    image_param = ActionController::Parameters.new({
      image: {
        attachment: params[:supplier][:image]
      }
    })
    @object.create_image(image_param.require(:image).permit(:attachment))
    params[:supplier].delete(:image)
  end
end