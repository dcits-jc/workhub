class Admin::SolutionTagsController < ApplicationController
  layout 'admin'
  # 需要管理员权限
  before_action :require_is_admin

  # 全部标签
  def index
    @solution_tags = SolutionTag.all
  end


  # 新建方案标签
  def new
    @solution_tag = SolutionTag.new
  end


  # 建立方案标签  
  def create
    @solution_tag = SolutionTag.new(solution_tag_params)
    if @solution_tag.save
      flash[:notice] = "标签建立成功!"
      redirect_to admin_solution_tags_path
    else
      flash[:alert] = "标签建立失败!"
      render :new
    end    
  end

  # 编辑
  def edit
    @solution_tag = SolutionTag.find(params[:id])
  end


  # 更新标签
  def update
    @solution_tag = SolutionTag.find(params[:id])
    if @solution_tag.update(solution_tag_params)
      flash[:notice] = "标签更新成功!"
      redirect_to admin_solution_tags_path
    else
      flash[:alert] = "标签更新失败!"
      render :edit
    end
  end



  def destroy
    @solution_tag = SolutionTag.find(params[:id])
    @solution_tag.destroy
    flash[:notice] = "标签已删除"
    redirect_to admin_solution_tags_path    
  end

  private

  # 解决方案标签
  def solution_tag_params
    params.require(:solution_tag).permit(:name,:solution_type)    
  end


end
