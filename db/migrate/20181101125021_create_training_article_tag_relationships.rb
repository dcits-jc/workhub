class CreateTrainingArticleTagRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :training_article_tag_relationships do |t|
      t.integer :training_tag_id
      t.integer :training_article_id
      t.timestamps
    end
  end
end
