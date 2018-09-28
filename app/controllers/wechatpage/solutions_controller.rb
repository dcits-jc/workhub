class Wechatpage::SolutionsController < WechatController
  layout 'wechat'
  def index
    # 解决方案搜索
    @q = Solution.ransack(params[:q])
    if params[:q].present?
      @solutions = @q.result(distinct: true)
    else
      @solutions = Solution.all
    end
    # 全部方案
    @all_solutions = @solutions
    # 筛选出所有按技术方向的标签
    @solution_tags_direction = SolutionTag.it_direction

    # 筛选出所有按行业的标签
    @solution_tags_industry = SolutionTag.it_industry
  end

  def show
    @solution = Solution.find(params[:id])
  end



end
