class ProjectWorkflowsController < ApplicationController

  def index
    
  end

  def new
    
  end


  def create
    @project_workflow = ProjectWorkflow.new(project_workflow_params)

    @project = Project.find(project_workflow_params[:project_id])
    if @project.enabled?
      
      # 将终止时间+23.59小时
      @project_workflow.end_time = @project_workflow.end_time+1.day-1.second
      
      # 如果用户成本没有,则设置为0
      if current_user.cost.blank?
        current_user.cost = 0
        current_user.save
        workflow_cost = 0
      else
        workflow_cost = current_user.cost
      end

      # 核算人天
      @project_workflow.cost = workflow_cost * @project_workflow.hours / 8

      # 两次','去重
      itvendors = dry_tsstring(@project_workflow.other_itvendors)
      # 如果这个厂商没找到,就新建这个厂商,最终加入隶属
      itvendors.each do |v|
        current_vendor = TagItvendor.find_by_name(v)
        if current_vendor.blank?
          current_vendor = TagItvendor.create(name: v)
        end
        @project_workflow.join_tag_itvendors(current_vendor)
      end
      @project_workflow.other_itvendors = nil

      # 两次','去重
      itskills = dry_tsstring(@project_workflow.other_itskills)
      # 如果这个技能没找到,就新建这个技能,最终加入隶属
      itskills.each do |s|
        current_skill = TagItskill.find_by_name(s)
        if current_skill.blank?
          current_skill = TagItskill.create(name: s)
        end
        @project_workflow.join_tag_itskills(current_skill)
      end
      @project_workflow.other_itskills = nil


      if @project_workflow.save
        # 加入当前用户作为成员
        @project_workflow.project.join!(current_user)
        # 建立 feed 流
        feed_create!(@project_workflow,current_user)
        flash[:notice] = "提交成功!"
        redirect_to root_path
      else
        flash[:alert] = "提交失败!"
        redirect_to root_path      
      end

    else
      flash[:alert] = "提交失败,该项目已被禁止继续报工!"
      redirect_to root_path       
    end



  end

  private

  def project_workflow_params
    params.require(:project_workflow).permit(:content,:project_id,:worktype,:begin_time,:end_time,:hours,:other_itvendors,:other_itskills,tag_itvendor_ids: [],tag_itskill_ids: [])
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
