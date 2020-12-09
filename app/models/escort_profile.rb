class EscortProfile < ApplicationRecord
  belongs_to :user
  belongs_to :type_subscription, optional: true
  has_and_belongs_to_many :services
  has_and_belongs_to_many :locations
  has_and_belongs_to_many :categories

  has_one_attached :profile_photo
  has_many_attached :photos

  validates :user_id, presence: true
  validates :phone, uniqueness: true, presence: true, length: { minimum: 10, maximum: 10 }
end
