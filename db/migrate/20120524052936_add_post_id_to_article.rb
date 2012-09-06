class AddPostIdToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :media_id, :integer
  end
end
