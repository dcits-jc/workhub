class Admin::ProjectCostsController < ApplicationController
  layout 'admin'
  # 需要管理员权限
  before_action :require_is_admin




  # 建立费用
  def create
    @project_cost = ProjectCost.new(project_cost_params)
    # 如果这个日期为空
    if project_cost_params[:commit_time].blank?
      @project_cost.commit_time = Time.new
    end
    # 工程费合计
    @project_cost.sum_engineer_fee = @project_cost.mould_fee + @project_cost.labor_fee + @project_cost.manual_fee
    # 全部费用合计
    @project_cost.sum_fee = @project_cost.mould_fee + @project_cost.labor_fee + @project_cost.manual_fee + @project_cost.custodian_fee
    @project_cost.save
    # 重定向
    @project = @project_cost.project
    redirect_to admin_project_path(@project)
  end

  # 删除该费用
  def destroy
    @project_cost = ProjectCost.find(params[:id])
    @project = @project_cost.project
    @project_cost.destroy
    redirect_to admin_project_path(@project)
  end

  private

  def project_cost_params
    params.require(:project_cost).permit(:mould_fee,:labor_fee,:manual_fee,:custodian_fee,:commit_time,:project_id)
  end

end
