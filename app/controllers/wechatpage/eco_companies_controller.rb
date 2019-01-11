class Wechatpage::EcoCompaniesController < ApplicationController
  layout 'wechat'

  def index
    @eco_companies = EcoCompany.all
    @eco_tags = EcoTag.all
  end

  def show
    @eco_company = EcoCompany.find(params[:id])
    @eco_tags = @eco_company.eco_tags
    @eco_company_attachments = @eco_company.eco_company_attachments
  end

end
