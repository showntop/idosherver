class AddAttachmentLogoToIdentities < ActiveRecord::Migration
  def self.up
    change_table :identities do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :identities, :logo
  end
end
