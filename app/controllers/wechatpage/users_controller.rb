class Wechatpage::UsersController < ActionController::Base
  layout 'wechat'
  def index
    @all_users = User.all
    # 用户搜索
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 20)
  end


  def user_search
    # 用户搜索
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 20)    
  end


  def show
    @user = User.find(params[:id])
  end

end
