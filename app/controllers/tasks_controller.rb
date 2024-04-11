class TasksController < InheritedResources::Base

  private

    def task_params
      params.require(:task).permit(:customer_id, :title, :body, :status)
    end

end
