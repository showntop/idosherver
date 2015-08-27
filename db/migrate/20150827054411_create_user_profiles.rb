class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :name
      t.string :gender
      t.string :location
      t.string :website
      t.string :bio

      t.timestamps null: false
    end
  end
end
