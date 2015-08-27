class AddIdentityToUserProfiles < ActiveRecord::Migration
  def change
    add_reference :user_profiles, :identity, index: true, foreign_key: true
  end
end
