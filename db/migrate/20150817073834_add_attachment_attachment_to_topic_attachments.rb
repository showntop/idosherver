class AddAttachmentAttachmentToTopicAttachments < ActiveRecord::Migration
  def self.up
    change_table :topic_attachments do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :topic_attachments, :attachment
  end
end
