class CreateTopicLikes < ActiveRecord::Migration
  def change
    create_table :topic_likes do |t|

      t.timestamps null: false
    end
  end
end
