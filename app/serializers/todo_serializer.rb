class TodoSerializer < ActiveModel::Serializer
  attributes :id, :title, :body
end
