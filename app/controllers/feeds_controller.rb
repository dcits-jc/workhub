class FeedsController < ApplicationController
  layout 'user'


  # 全部工作流
  def index
    
  end



  def week
    # 设置当前时间
    @current_time = Time.now

    if params[:start_date].present? and params[:end_date].present?
      @start_date = Time.parse(params[:start_date])
      @end_date = Time.parse(params[:end_date])
    else
      @start_date = @current_time.at_beginning_of_week
      @end_date = @current_time.at_end_of_week
    end

    # 历史周
    @history_weeks = weekindex(Time.now, current_user.created_at)

    # 项目工作流
    @project_workflow = ProjectWorkflow.new
    # 非项目工作流
    @management_workflow = ManagementWorkflow.new

    @feeds = current_user.feeds.where(end_time: @start_date..@end_date).order("feeds.created_at DESC")

    # 导出的数据
    @export_feeds = @feeds
    
    # 本周工作量计算
    loads = 0
    
    @feeds.each do |f|
      loads = loads + f.feedable.hours
    end

    @current_week_workloads = loads
    
    # 检索最近参与过5个项目
    @last_projects = current_user.participated_projects.reverse[0..4]


    # 数据导出
    respond_to do |format|
      format.html
      format.xls{ 
        # 设置文件名
        headers["Content-Disposition"]="attachment; filename=周报导出("+@start_date.strftime('%Y-%m-%d')+"~"+@end_date.strftime('%Y-%m-%d')+").xls"
      }  
    end

    
  end


  def destroy
    @feed = Feed.find(params[:id])
    if @feed.destroy
      flash[:notice] = '删除成功'
      redirect_to week_feeds_path
    else
      flash[:alert] = '删除失败'
      redirect_to week_feeds_path
    end
  end





end
