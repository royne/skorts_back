class EscortProfileSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :profile_photo, :city, :description, :photos, :price, :schedule, :stars, :verified, :sex, :age, :subscription, :phone
  has_one :user
  has_many :services
  has_many :locations
  has_many :categories
  has_one :type_subscription
  
end
