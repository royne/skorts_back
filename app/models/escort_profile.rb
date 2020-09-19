class EscortProfile < ApplicationRecord
  belongs_to :user
  belongs_to :type_subscription
  has_and_belongs_to_many :services
  has_and_belongs_to_many :locations
  has_and_belongs_to_many :categories

  validates :user_id, presence: true
end
