class Admin::SolutionsController < ApplicationController
  layout 'admin'
  # 需要管理员权限
  before_action :require_is_admin

  def index
    @solutions = Solution.all
  end

  def edit
    @solution = Solution.find(params[:id])   
  end

  def new
    @solution = Solution.new
  end

  def update
    @solution = Solution.find(params[:id])
    if @solution.update(solution_params)
      flash[:notice] = "解决方案更新成功!"
      redirect_to admin_solutions_path
    else
      flash[:alert] = "解决方案更新失败!"
      render :edit
    end
  end

  def create
    @solution = Solution.new(solution_params)
    if @solution.save
      flash[:notice] = "解决方案建立成功!"
      redirect_to admin_solutions_path
    else
      flash[:alert] = "解决方案建立失败!"
      render :new
    end
  end

  private

  def solution_params
    params.require(:solution).permit(:name, :background, :desc,:value, :success_case, :solution_pic)
  end

end