class WorkflowsController < ApplicationController

  # 全部工作流
  def index
    
  end

  # 当周
  def current_week
    # 设置当前时间
    @current_time = Time.now
    # 历史周
    @history_weeks = weekindex(Time.now, current_user.created_at)
    # binding.pry
  end


  def week
    # 用户创建时间
    user_created_time = current_user.create_at
  end





  private




  # 周遍历
  def weekindex(time_end,time_begin)
    # 建立一个周列表
    week_list = []
    # 将时间指针设置成最后时间
    time_cur = time_end
    # 当指针的周起始时间 在 初始时间之后
    while time_cur.at_beginning_of_week > time_begin
      # 就将该指针加入周列表
      week_list << time_cur
      # 并向前再推一周
      time_cur = time_cur - 1.week
    end
    # 最后把初始时间加入指针列表
    week_list << time_begin
    # 最后把当前时间从列表取出,保证只有历史周记录
    # week_list.delete(time_end)
    week_list
  end


end
