class Category < ActiveRecord::Base
  belongs_to :parent, class_name: :Category
  has_many :children, ->{ where(parent_id: self.id)}

  has_many :topics
  has_attached_file :background, styles: {thumbnail: "60x60#"}
  validates_attachment_content_type :background, :content_type => /\Aimage\/.*\Z/

  has_attached_file :logo, styles: {thumbnail: "60x60#"}
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

  def group
    { camp1: first(5), camp2: last(5) }
  end
end
