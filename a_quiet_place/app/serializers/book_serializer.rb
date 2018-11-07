class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :rating, :snippet, :image, :users

  has_many :users
end
