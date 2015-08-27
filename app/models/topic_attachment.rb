class TopicAttachment < ActiveRecord::Base
  
  has_attached_file :attachment, styles: {thumbnail: "60x60#"}
  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/

  def uuid
    
  end

end
