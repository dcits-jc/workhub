class Admin::EcoTagsController < ApplicationController
  layout 'admin'
  # 需要管理员权限
  before_action :require_is_admin

  def index
    # 全部公司标签
    @eco_tags = EcoTag.all
  end

  def show
    # 指定的公司标签
    @eco_tag = EcoTag.find(params[:id])
  end

  def edit
    # 指定的公司标签
    @eco_tag = EcoTag.find(params[:id])
  end

  def new
    @eco_tag = EcoTag.new
  end

  def create
    @eco_tag = EcoTag.new(eco_tag_params)
    if @eco_tag.update(eco_tag_params)
      flash[:notice] = "公司标签新建成功!"
      redirect_to admin_eco_tags_path
    else
      flash[:alert] = "公司标签新建失败!"
      render :new
    end     
  end

  def update
    @eco_tag = EcoTag.new(eco_tag_params)
    if @eco_tag.update(eco_tag_params)
      flash[:notice] = "公司标签更新成功!"
      redirect_to admin_eco_tags_path
    else
      flash[:alert] = "公司标签更新失败!"
      render :new
    end  
  end

  def destroy
    @eco_tag = EcoTag.find(params[:id])
    @eco_tag.destroy
    flash[:alert] = "培训标签已删除"
    redirect_to admin_eco_tags_path
  end

  def eco_tag_params
    params.require(:eco_tag).permit(:name)
  end

end
