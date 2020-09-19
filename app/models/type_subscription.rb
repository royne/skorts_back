class TypeSubscription < ApplicationRecord
  has_many :escort_profiles

  validates :name, presence: true
end
