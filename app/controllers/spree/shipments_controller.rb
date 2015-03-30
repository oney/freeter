class Spree::ShipmentsController < Spree::StoreController
  before_action :load_shipment, only: [:show, :send_message]
  before_action :load_conversation, only: [:show, :send_message]

  def send_message
    spree_current_user.reply_to_conversation(@conversation, params[:body])
    redirect_to action: :show
  end
  private
    def load_shipment
      @shipment = Spree::Shipment.find_by!(number: params[:id])
    end
    def load_conversation
      @conversation = @shipment.conversation_info.conversation
    end

end
