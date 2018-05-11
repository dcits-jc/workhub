class Admin::FeedsController < ApplicationController
  layout 'admin'
  # 需要管理员权限
  before_action :require_is_admin

  def index
    # 设置当前时间
    @current_time = Time.now

    @teams = Team.includes(:users).all.order_by_name

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

    # 全部的应提周报人数
    @total_user_feedneeded = User.where(is_feedneeded: true).order_by_team
    
    # 提交人数
    @feeds_groupby_users = @export_feeds.group_by{|r| r.user}

    # 提取用户
    @feed_committed_users = @feeds_groupby_users.map { |u| u[0] }

    # 应提交未提交用户
    @feed_uncommitted_users = @total_user_feedneeded - @feed_committed_users

    # 根据参数决定筛选出来的结果
    if params[:users_feedneeded] == 'committed'
      @feeded_users = @feed_committed_users
    elsif params[:users_feedneeded] == 'uncommitted'
      @feeded_users = @feed_uncommitted_users
    else
      @feeded_users = @total_user_feedneeded
    end

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
