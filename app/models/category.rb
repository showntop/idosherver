class Category < ActiveRecord::Base
  belongs_to :parent, class_name: :Category
  has_many :children, ->{ where(parent_id: self.id)}

  has_attached_file :background, styles: {thumbnail: "60x60#"}

  def background_url
    background
  end
end
