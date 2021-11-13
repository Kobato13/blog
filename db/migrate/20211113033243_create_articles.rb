class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.text :content

      t.boolean :published, default: false
      t.datetime :published_at

      t.timestamps
    end
  end
end
