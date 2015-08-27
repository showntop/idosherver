class AddProfileToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :profile, :string
  end
end
