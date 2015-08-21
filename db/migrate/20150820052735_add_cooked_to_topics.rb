class AddCookedToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :cooked, :text
  end
end
