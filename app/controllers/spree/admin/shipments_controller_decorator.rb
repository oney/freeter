Spree::Admin::ShipmentsController.class_eval do
  before_action :load_conversation, only: [:edit, :send_message]

  def send_message
    spree_current_user.reply_to_conversation(@conversation, params[:body])
    redirect_to action: :edit
  end
  private

    def load_conversation
      @conversation = @object.conversation_info.conversation
    end
end
