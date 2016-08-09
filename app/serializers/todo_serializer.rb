class TodoSerializer < ActiveModel::Serializer
  attributes :id, :title, :completed, :order, :category
  belongs_to :user
end
