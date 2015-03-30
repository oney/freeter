class Spree::TasksController < Spree::StoreController
  before_action :load_task, only: [:show, :apply, :submit]

  respond_to :html

  def index
    @tasks = Spree::Task.all
  end

  def apply
  end

  def submit
    receipt = spree_current_user.send_message(@task.user, params[:body], "New task")

    conversation = receipt.conversation
    conversation.create_info
    conversation.info.task = @task
    conversation.info.state = 2
    conversation.info.save
    redirect_to conversation_path(conversation)
  end

private
  def load_task
    @task = Spree::Task.find(params[:id])
  end

end
