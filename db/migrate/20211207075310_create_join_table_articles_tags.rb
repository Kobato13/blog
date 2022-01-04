class CreateJoinTableArticlesTags < ActiveRecord::Migration[6.1]
  def change
    create_join_table :articles, :tags do |t|
      #t.references :article, index: true, foreign_key: true
      #t.references :tag, index: true, foreign_key: true
      t.index [:article_id, :tag_id]
      t.index [:tag_id, :article_id]
    end
  end
end
