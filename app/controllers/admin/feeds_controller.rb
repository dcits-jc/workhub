class Admin::FeedsController < ApplicationController
  layout 'admin'
  # 需要管理员权限
  before_action :require_is_admin

  def index
    @feeds = Feed.all.order_by_recent.paginate(:page => params[:page], :per_page => 20)
  end

end
