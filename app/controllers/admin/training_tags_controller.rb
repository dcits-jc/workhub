class Admin::TrainingTagsController < ApplicationController
  layout 'admin'

  def index
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

  def new
    @training_tag = TrainingTag.new
  end

  def edit
    @training_tag = TrainingTag.find(params[:id])
  end

  def update
    @training_tag = TrainingTag.find(params[:id])
    if @training_tag.update(training_tag_params)
      flash[:notice] = "培训标签更新成功!"
      redirect_to admin_training_tags_path
    else
      flash[:alert] = "培训标签更新失败!"
      render :edit
    end    
  end


  def create
    @training_tag = TrainingTag.new(training_tag_params)
    if @training_tag.update(training_tag_params)
      flash[:notice] = "培训标签新建成功!"
      redirect_to admin_training_tags_path
    else
      flash[:alert] = "培训标签新建失败!"
      render :new
    end     
  end

  def destroy
    @training_tag = TrainingTag.find(params[:id])
    @training_tag.destroy
    flash[:alert] = "培训标签已删除"
    redirect_to admin_training_tags_path
  end

  private

  def training_tag_params
    params.require(:training_tag).permit(:name, :training_type, :img)
  end

end
