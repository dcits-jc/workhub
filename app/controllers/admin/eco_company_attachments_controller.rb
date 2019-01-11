class Admin::EcoCompanyAttachmentsController < ApplicationController
  layout 'admin'
  # 需要管理员权限
  before_action :require_is_admin

  def create
    @eco_company_attachment = EcoCompanyAttachment.new(eco_company_attachment_params)
    if @eco_company_attachment.save
      flash[:notice] = "资料新建成功!"
      redirect_to admin_eco_company_path(@eco_company_attachment.eco_company)
    else
      flash[:alert] = "资料新建失败!"
      redirect_to admin_eco_company_path(@eco_company_attachment.eco_company)
    end     
  end

  def destroy
    @eco_company_attachment = EcoCompanyAttachment.find(params[:id])
    @eco_company = @eco_company_attachment.eco_company
    @eco_company_attachment.destroy
    flash[:alert] = "资料已删除"
    redirect_to admin_eco_company_path(@eco_company)
  end

  def eco_company_attachment_params
    params.require(:eco_company_attachment).permit(:attachment,:eco_company_id)
  end

end
