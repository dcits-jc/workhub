class Admin::TrainingArticlesController < ApplicationController
  layout 'admin'

  def index
    @training_articles = TrainingArticle.all
    @training_tags = TrainingTag.all
  end

  def show
    @training_article = TrainingArticle.find(params[:id])
    # 全部改标签下的培训
    @training_articles = @training_article.training_articles
  end

  def new
    @training_article = TrainingArticle.new
    @training_tags = TrainingTag.all
  end

  def edit
    @training_article = TrainingArticle.find(params[:id])
    @training_tags = TrainingTag.all
  end

  def update
    @training_article = TrainingArticle.find(params[:id])
    if @training_article.update(training_article_params)
      flash[:notice] = "培训资料更新成功!"
      redirect_to admin_training_articles_path
    else
      flash[:alert] = "培训资料更新失败!"
      render :edit
    end    
  end


  def create
    @training_article = TrainingArticle.new(training_article_params)
    if @training_article.update(training_article_params)
      flash[:notice] = "培训资料新建成功!"
      redirect_to admin_training_articles_path
    else
      flash[:alert] = "培训资料新建失败!"
      render :new
    end     
  end

  def destroy
    @training_article = TrainingArticle.find(params[:id])
    @training_article.destroy
    flash[:alert] = "培训资料已删除"
    redirect_to admin_training_articles_path
  end

  private

  def training_article_params
    params.require(:training_article).permit(:name, :wechatlink,:plantform, :place, :level,training_tag_ids: [])
  end

  
end
