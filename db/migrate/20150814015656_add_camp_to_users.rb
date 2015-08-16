class AddCampToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :camp, index: true, foreign_key: true
  end
end
