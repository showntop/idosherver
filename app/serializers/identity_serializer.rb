class IdentitySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :logo_url
end
