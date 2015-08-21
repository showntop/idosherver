class AddTopicToReplies < ActiveRecord::Migration
  def change
    add_reference :replies, :topic, index: true, foreign_key: true
  end
end
