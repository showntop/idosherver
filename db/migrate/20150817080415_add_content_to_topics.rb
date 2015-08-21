class AddContentToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :raw_content, :text
  end
end
