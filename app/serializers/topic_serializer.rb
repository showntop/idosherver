class TopicSerializer < ActiveModel::Serializer
  attributes :id, :title, :cooked, :user
end
