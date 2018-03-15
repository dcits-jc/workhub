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
    team_feeds = Feed.includes(:user).where(users: {team: @current_team})

    # 倒叙排列
    @all_team_feeds = team_feeds.order("feeds.updated_at DESC")

    # 所有团队成员
    @all_team_users = @current_team.users
  end


end
