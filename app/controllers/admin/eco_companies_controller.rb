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
  end

  def edit
    # 指定的公司
    @eco_company = EcoCompany.find(params[:id])
  end
end
