class EscortProfileSerializer < ActiveModel::Serializer
  attributes :id, :first_namee, :last_name, :profile_photog, :city, :description, :photos, :price, :schedule, :stars, :verified, :sex, :age, :subscriptio
  has_one :users
  has_one :services
  has_one :locations
  has_one :type_subscriptions
end
