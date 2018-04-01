class UsersController < ApplicationController
  layout 'other_user'
  def show
    @user = User.find(params[:id])
    # 设置当前时间
    @current_time = Time.now
    # 历史周
    @history_weeks = weekindex(Time.now, @user.created_at)

    @feeds = @user.feeds.order_by_recent
    
    # 本周工作量计算
    loads = 0
    @feeds.each do |f|
      loads = loads + f.feedable.hours
    end
    @current_week_workloads = loads
  end


end
