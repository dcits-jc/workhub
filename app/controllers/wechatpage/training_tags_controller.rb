class Wechatpage::TrainingTagsController < WechatController
  layout 'wechat'
  before_action :search_blank 



  def itvendors_index
    # 全部厂商培训
    @training_tags_itvendors = TrainingTag.all_itvendors

    @all_itvendors_articles = []
    @training_tags_itvendors.each do |tag|
      tag.training_articles.each do |a|
        if !@all_itvendors_articles.include?(a)
          @all_itvendors_articles << a
        end
      end
    end
  end

  def solutions_index
    # 全部解决方案培训
    @training_tags_solutions = TrainingTag.all_solutions
    @all_solutions_articles = []
    @training_tags_solutions.each do |tag|
      tag.training_articles.each do |a|
        @all_solutions_articles << a
      end
    end

  end

  def generals_index
    # 全部通用培训
    @training_tags_generals = TrainingTag.all_generals

    @all_generals_articles = []
    @training_tags_generals.each do |tag|
      tag.training_articles.each do |a|
        if !@all_generals_articles.include?(a)
          @all_generals_articles << a
        end
      end
    end
  end

  def show
    @training_tag = TrainingTag.find(params[:id])
    # 全部改标签下的培训
    @training_articles = @training_tag.training_articles
  end


  def index
    
  end


  private

  def search_blank
    # 搜索指定培训名
    @q = TrainingArticle.ransack(params[:q])
    if params[:q].present?
      @training_articles = @q.result(distinct: true).order_by_created_at
    else
      @training_articles = nil
    end    
  end

end
