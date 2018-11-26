class Wechatpage::TrainingArticlesController < ApplicationController
  layout 'wechat'
  before_action :search_blank 



  def index
    
  end

  private

  def search_blank
    # 搜索指定培训名
    @q = TrainingArticle.ransack(params[:q])
    if params[:q].present?
      @training_articles = @q.result(distinct: true)
    else
      @training_articles = nil
    end    
  end



end
