class Wechatpage::TrainingTagsController < ApplicationController

  layout 'wechat'

  def index
    # 搜索指定培训名
    @q = TrainingArticle.ransack(params[:q])
    if params[:q].present?
      @training_articles = @q.result(distinct: true).order_by_created_at
    else
      @training_articles = nil
    end
    # 全部厂商培训
    @training_tags_itvendors = TrainingTag.all_itvendors
    # 全部解决方案培训
    @training_tags_solutions = TrainingTag.all_solutions
    # 全部通用培训
    @training_tags_generals = TrainingTag.all_generals
  end

  def show
    @training_tag = TrainingTag.find(params[:id])
    # 全部改标签下的培训
    @training_articles = @training_tag.training_articles
  end


end
