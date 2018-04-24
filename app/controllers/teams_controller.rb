class TeamsController < ApplicationController
  layout 'user'

  def week
    if params[:team_id].present?
      @current_team = Team.find(params[:team_id])
    else
      # 当前用户团队
      @current_team = current_user.team
    end

    # 子部门
    @children_teams = @current_team.children

    # 历史周
    @history_weeks = weekindex(Time.now, @current_team.created_at)

    # 如果参数存在,则用参数的
    if params[:start_date].present? and params[:end_date].present?
      @start_date = Time.parse(params[:start_date])
      @end_date = Time.parse(params[:end_date])
    # 不存在的话就显示当周的    
    else
      @start_date = Time.now.at_beginning_of_week
      @end_date = Time.now.at_end_of_week    
    end


    # 设置当前时间
    @current_time = Time.now
    # 历史周
    @history_weeks = weekindex(Time.now, @current_team.created_at)

    # 先检索出这段时间该团队所有的 feeds endtime
    team_feeds = Feed.includes(:user).where( users: { team_id: @current_team.id },feeds: { end_time: @start_date..@end_date })

    # # 如果当前团队有子团队
    # if @current_team.has_children?
      
    # else
      
    # end


    # 最后排序
    @feeds = team_feeds.order("feeds.created_at DESC")

    # 导出的数据
    @export_feeds = @feeds

    # 当周工作量计算
    loads = 0
    @feeds.each do |f|
      loads = loads + f.feedable.hours
    end
    @current_week_workloads = loads


    # 所有团队成员
    @all_team_users = @current_team.users

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
