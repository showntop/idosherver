class RemoveBackgroundUrlFromCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :background_url, :string
  end
end
