class AddAvatarFingerprintToTopicAttachment < ActiveRecord::Migration
  def change
    add_column :topic_attachments, :fingerprint, :string
  end
end
