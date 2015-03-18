class Spree::ConversationsController < Spree::StoreController
  before_action :load_conversation, only: [:show, :new, :create]

  respond_to :html

  def index
    @conversations = spree_current_user.mailbox.conversations
  end

  def show
  end

  def send_message
    @conversation = spree_current_user.mailbox.conversations.find(params[:format])
    spree_current_user.reply_to_conversation(@conversation, params[:body])
    redirect_to action: :show, id: params[:format]
  end

  private
    def accurate_title
      if @product
        @product.meta_title.blank? ? @product.name : @product.meta_title
      else
        super
      end
    end

    def load_conversation
      @conversation = spree_current_user.mailbox.conversations.find(params[:id])
    end

end
