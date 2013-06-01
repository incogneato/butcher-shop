class PrimalCut < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  has_many   :cuts

  validates :name, :presence => true
end
