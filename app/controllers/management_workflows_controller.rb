class ManagementWorkflowsController < ApplicationController


  def index
    
  end

  def new
    
  end


  def create
    @management_workflow = ManagementWorkflow.new(management_workflow_params)
    
    # 将终止时间+23.59小时
    @management_workflow.end_time = @management_workflow.end_time+1.day-1.second

    # 如果用户成本没有,则设置为0
    if current_user.cost.blank?
      current_user.cost = 0
      current_user.save
      workflow_cost = 0
    else
      workflow_cost = current_user.cost
    end

    # 核算人天
    @management_workflow.cost = workflow_cost * @management_workflow.hours / 8

    # 根据工作类别选择对应管理项目
    case management_workflow_params[:worktype]
    when 'technical_exchange'
      @management_workflow.project = current_user.project_technical_exchange
    when 'certification_exam'
      @management_workflow.project = current_user.project_certification_exam
    when 'tech_improvement'
      @management_workflow.project = current_user.project_tech_improvement
    when 'team_work'
      @management_workflow.project = current_user.project_team_work
    when 'day_off'
      @management_workflow.project = current_user.project_day_off
    end
    
    # 两次','去重
    itvendors = dry_tsstring(@management_workflow.other_itvendors)
    # 如果这个厂商没找到,就新建这个厂商,最终加入隶属
    itvendors.each do |v|
      current_vendor = TagItvendor.find_by_name(v)
      if current_vendor.blank?
        current_vendor = TagItvendor.create(name: v)
      end
      @management_workflow.join_tag_itvendors(current_vendor)
    end
    @management_workflow.other_itvendors = nil

    # 两次','去重
    itskills = dry_tsstring(@management_workflow.other_itskills)
    # 如果这个技能没找到,就新建这个技能,最终加入隶属
    itskills.each do |s|
      current_skill = TagItskill.find_by_name(s)
      if current_skill.blank?
        current_skill = TagItskill.create(name: s)
      end
      @management_workflow.join_tag_itskills(current_skill)
    end
    @management_workflow.other_itskills = nil


    if @management_workflow.save
      # 建立 feed 流
      feed_create!(@management_workflow,current_user)
      flash[:notice] = "提交成功!"
      redirect_to root_path
    else
      flash[:alert] = "提交失败!"
      redirect_to root_path      
    end
  end

  private

  def management_workflow_params
    params.require(:management_workflow).permit(:content,:project_id,:worktype,:begin_time,:end_time,:hours,:other_itvendors,:other_itskills,tag_itvendor_ids: [],tag_itskill_ids: [])
  end


  # 两次去除半角和全角逗号
  def dry_tsstring(ts_string)
    ts_list = []
    ts_list1 = ts_string.split(',')
    ts_list1.each do |t1|
      ts_list2 = t1.split('，')
      ts_list2.each do |t2|
        ts_list.push(t2)
      end
    end
    ts_list
  end

end
