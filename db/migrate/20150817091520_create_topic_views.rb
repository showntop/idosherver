class CreateTopicViews < ActiveRecord::Migration
  def change
    create_table :topic_views do |t|

      t.timestamps null: false
    end
  end
end
