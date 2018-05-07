class Admin::FeedsController < ApplicationController
  layout 'admin'
  # 需要管理员权限
  before_action :require_is_admin

  def index
    # 设置当前时间
    @current_time = Time.now

    @teams = Team.includes(:users).all

    if params[:start_date].present? and params[:end_date].present?
      @start_date = Time.parse(params[:start_date])
      @end_date = Time.parse(params[:end_date])
    else
      @start_date = @current_time.at_beginning_of_week
      @end_date = @current_time.at_end_of_week
    end

    # 历史周
    @history_weeks = weekindex(Time.now, current_user.created_at)

    @feeds = Feed.where(end_time: @start_date..@end_date).order("feeds.created_at DESC").paginate(:page => params[:page], :per_page => 20)

    # 导出的数据不分页
    @export_feeds = Feed.where(end_time: @start_date..@end_date).order("feeds.created_at DESC")

    # 提交人数
    @feeds_users_count = @export_feeds.group_by{|r| r.user_id}.count


    # 数据导出
    respond_to do |format|
      format.html
      format.xls{ 
        # 设置文件名
        headers["Content-Disposition"]="attachment; filename=周报导出("+@start_date.strftime('%Y-%m-%d')+"~"+@end_date.strftime('%Y-%m-%d')+").xls"
      }  
    end

  end

end
