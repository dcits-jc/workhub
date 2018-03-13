class ProjectWorkflowsController < ApplicationController

  def index
    
  end

  def new
    
  end


  def create
    @project_workflow = ProjectWorkflow.new(project_workflow_params)
    if @project_workflow.save!
      # 建立 feed 流
      feed_create!(@project_workflow)
      flash[:notice] = "提交成功!"
      redirect_to root_path
    else
      flash[:notice] = "提交失败!"
      redirect_to root_path      
    end
  end

  private

  def project_workflow_params
    params.require(:project_workflow).permit(:content,:project_id)
  end
end
