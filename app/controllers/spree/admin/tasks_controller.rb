module Spree
  module Admin
    class TasksController < ResourceController
      before_action :load_task, only: [:show, :edit]
      create.before :create_before

      respond_to :html

      def index
        @tasks = spree_current_user.tasks
      end

      def show
      end

    private
      def load_task
        @task = spree_current_user.tasks.find(params[:id])
      end

      def create_before
        @object.user = spree_current_user
      end

    end
  end
end