class Identity < ActiveRecord::Base

  has_attached_file :logo, styles: {thumbnail: "60x60#"}
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

  def logo_url
    logo
  end
end
