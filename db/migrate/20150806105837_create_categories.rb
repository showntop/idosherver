class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.string :parent_id
      t.string :logo_url
      t.string :background_url

      t.timestamps null: false
    end
  end
end
