class RemoveLogoUrlFromCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :logo_url, :string
  end
end
