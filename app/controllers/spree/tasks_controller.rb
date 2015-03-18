class Spree::TasksController < Spree::StoreController
  before_action :load_task, only: [:show]

  respond_to :html

  def index
    @tasks = Spree::Task.all
  end

  def show
  end

private
  def load_task
    @task = spree_current_user.tasks.find(params[:id])
  end

end
