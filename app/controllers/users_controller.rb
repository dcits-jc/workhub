class UsersController < ApplicationController
  layout 'other_user'
  
  def show
    @user = User.find(params[:id])
    # 设置当前时间
    @current_time = Time.now
    # 历史周
    @history_weeks = weekindex(Time.now, @user.created_at)

    if params[:start_date].present? and params[:end_date].present?
      start_date = params[:start_date]
      end_date = params[:end_date]
      # 找到指定用户
      @user = User.find(params[:id])
    else
      start_date = @current_time.at_beginning_of_week
      end_date = @current_time.at_end_of_week
    end


    @feeds = @user.feeds.where(end_time: start_date..end_date).order("feeds.created_at DESC")
    
    # 本周工作量计算
    loads = 0
    @feeds.each do |f|
      loads = loads + f.feedable.hours
    end
    @current_week_workloads = loads
  end

end
