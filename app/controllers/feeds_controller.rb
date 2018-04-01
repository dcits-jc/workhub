class FeedsController < ApplicationController
  layout 'user'


  # 全部工作流
  def index
    
  end

  # 当周
  def current_week
    # 设置当前时间
    @current_time = Time.now
    # 历史周
    @history_weeks = weekindex(Time.now, current_user.created_at)

    # 项目工作流
    @project_workflow = ProjectWorkflow.new
    # 非项目工作流
    @management_workflow = ManagementWorkflow.new

    @feeds = current_user.feeds.order_by_recent
    
    # 本周工作量计算
    loads = 0
    @feeds.each do |f|
      loads = loads + f.feedable.hours
    end
    @current_week_workloads = loads
  end


  def week
    # 设置当前时间
    @current_time = Time.now
    # 历史周
    @history_weeks = weekindex(Time.now, current_user.created_at)

    if params[:start_date].present? and params[:end_date].present?
      start_date = params[:start_date]
      end_date = params[:end_date]
    else
      start_date = @current_time.at_beginning_of_week
      end_date = @current_time.at_end_of_week
    end



    # 项目工作流
    @project_workflow = ProjectWorkflow.new
    # 非项目工作流
    @management_workflow = ManagementWorkflow.new

    @feeds = current_user.feeds.where( end_time: start_date..end_date)

    # 本周工作量计算
    loads = 0
    @feeds.each do |f|
      loads = loads + f.feedable.hours
    end
    @current_week_workloads = loads
  end



  # 历史区间
  def history
    start_date = params[:start_date]
    end_date = params[:end_date]

    # 设置当前时间
    @current_time = Time.now
    # 历史周
    @history_weeks = weekindex(Time.now, current_user.created_at)

    # 项目工作流
    @project_workflow = ProjectWorkflow.new
    # 非项目工作流
    @management_workflow = ManagementWorkflow.new

    @feeds = current_user.feeds.where('created_at > ? and created_at < ?',start_date,end_date)

    # 本周工作量计算
    loads = 0
    @feeds.each do |f|
      loads = loads + f.feedable.hours
    end
    @current_week_workloads = loads

  end



  private





end
