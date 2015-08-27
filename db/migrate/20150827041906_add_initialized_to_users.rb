class AddInitializedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :initialized, :boolean, default: false
  end
end
