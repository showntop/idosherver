class AddTopicAndUserToTopicLikes < ActiveRecord::Migration
  def change
    add_reference :topic_likes, :user, index: true, foreign_key: true
    add_reference :topic_likes, :topic, index: true, foreign_key: true
  end
end
