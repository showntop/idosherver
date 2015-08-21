class AddTopicToTopicAttachments < ActiveRecord::Migration
  def change
    add_reference :topic_attachments, :topic, index: true, foreign_key: true
  end
end
