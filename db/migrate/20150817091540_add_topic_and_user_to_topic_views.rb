class AddTopicAndUserToTopicViews < ActiveRecord::Migration
  def change
    add_reference :topic_views, :user, index: true, foreign_key: true
    add_reference :topic_views, :topic, index: true, foreign_key: true
  end
end
