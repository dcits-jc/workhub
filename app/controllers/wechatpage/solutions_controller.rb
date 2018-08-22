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
      
  end

  def show
    @solution = Solution.find(params[:id])
  end

end
