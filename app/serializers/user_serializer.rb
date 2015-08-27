class UserSerializer < ActiveModel::Serializer
  attributes :id, :login, :token, :initialized, :location, :gender
end
