class AddWeichatlinkToTrainingArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :training_articles, :wechatlink, :string
  end
end
