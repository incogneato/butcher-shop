class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :name, :meal, :cut_id, :user_id, :created_at, :updated_at

  has_one :cut
end
