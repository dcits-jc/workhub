class Wechatpage::UsersController < ActionController::Base
  layout 'wechat'
  def index
    # @all_users = User.where(worktype: "技术")
    # 用户搜索
    @q = User.ransack(params[:q])
    if params[:q].present?
      @users = @q.result(distinct: true).order_by_itcode
    else
      @users = nil
    end
      
  end


  def user_search
    # 用户搜索
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 20)    
  end


  def show
    @user = User.find(params[:id])
  end


  def user_has_idcard
    # 筛选出有身份证的
    @users = User.where("idcard_attachment <> ''")
  end


  def user_has_degree
    # 筛选出有学位证的
    @users = User.where("degree_attachment <> ''")
  end


  def user_has_resume
    # 筛选出有简历的
    @users = User.where("resume_attachment <> ''")
  end


  # 大专
  def user_degree_college
    @users = User.where("degree = '大专'")
  end

  # 本科
  def user_degree_university
    @users = User.where("degree = '本科'")
  end


  # 硕士
  def user_degree_master
    @users = User.where("degree = '硕士'")
  end

  # 博士
  def user_degree_doctor
    @users = User.where("degree = '博士'")
  end

end
