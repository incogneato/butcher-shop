class Favorite < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  validates :meal, :presence => true

  belongs_to :user
  has_one    :cut
end
