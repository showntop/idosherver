class CreateTopicAttachments < ActiveRecord::Migration
  def change
    create_table :topic_attachments do |t|

      t.timestamps null: false
    end
  end
end
