class RemoveBackgroundUrlFromCategories < ActiveRecord::Migration
  def change
    remove :background_url, :categories
  end
end
