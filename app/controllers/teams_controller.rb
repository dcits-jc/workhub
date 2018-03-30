class TeamsController < ApplicationController
  layout 'user'

  # 当前团队
  def current_week
    # 设置当前时间
    @current_time = Time.now

    # 当前团队
    @current_team = current_user.team

    # 历史周
    @history_weeks = weekindex(Time.now, @current_team.created_at)

    # 进阶查询(筛选出所有这个团队成员的 feeds)
    # team_feeds = Feed.includes(:user).where('created_at > ? and created_at < ? and users.team == ?',start_date,end_date,@current_team.id)

    team_feeds = Feed.includes(:user).where(users: {team: @current_team})

    # 倒叙排列
    @feeds = team_feeds.order("feeds.updated_at DESC")

    # 所有团队成员
    @all_team_users = @current_team.users
  end


  # 历史区间
  def history
    # 当前团队
    @current_team = current_user.team

    # 历史周
    @history_weeks = weekindex(Time.now, @current_team.created_at)
    
    start_date = params[:start_date]
    end_date = params[:end_date]

    # 设置当前时间
    @current_time = Time.now
    # 历史周
    @history_weeks = weekindex(Time.now, current_user.created_at)


    team_feeds = Feed.includes(:user).where('feeds.created_at > ? and feeds.created_at < ?',start_date,end_date)

    @feeds = team_feeds.order("feeds.updated_at DESC")

    # 本周工作量计算
    loads = 0
    @feeds.each do |f|
      loads = loads + f.feedable.hours
    end
    @current_week_workloads = loads


    # 所有团队成员
    @all_team_users = @current_team.users
  end

end
