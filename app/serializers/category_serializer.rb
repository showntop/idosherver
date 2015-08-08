class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :parent_id, :background 
end
