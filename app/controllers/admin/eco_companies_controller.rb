class Admin::EcoCompaniesController < ApplicationController
  layout 'admin'
  # 需要管理员权限
  before_action :require_is_admin

  def index
    # 全部公司
    @eco_companies = EcoCompany.all
  end

  def show
    # 指定的公司
    @eco_company = EcoCompany.find(params[:id])
    @eco_company_attachments = @eco_company.eco_company_attachments
    @eco_company_attachment = EcoCompanyAttachment.new
  end

  def edit
    # 指定的公司
    @eco_company = EcoCompany.find(params[:id])
    @eco_tags = EcoTag.all
  end

  def new
    @eco_company = EcoCompany.new
    @eco_tags = EcoTag.all
  end

  def create
    @eco_company = EcoCompany.new(eco_company_params)
    if @eco_company.update(eco_company_params)
      flash[:notice] = "公司新建成功!"
      redirect_to admin_eco_companies_path
    else
      flash[:alert] = "公司新建失败!"
      render :new
    end     
  end

  def update
    @eco_company = EcoCompany.find(params[:id])
    if @eco_company.update(eco_company_params)
      flash[:notice] = "公司更新成功!"
      redirect_to admin_eco_companies_path
    else
      flash[:alert] = "公司更新失败!"
      render :new
    end  
  end

  def destroy
    @eco_company = EcoCompany.find(params[:id])
    @eco_company.destroy
    flash[:alert] = "培训标签已删除"
    redirect_to admin_eco_companies_path
  end


  def eco_company_params
    params.require(:eco_company).permit(:name,:img, :description, :contact_name,:contact_phone,eco_tag_ids: [])
  end


end
