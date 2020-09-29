class EscortProfileSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :username, :first_name, :last_name, :city, :description, :price, :schedule, :stars, :verified, :sex, :age, :subscription, :phone, :profile_photo
  has_one :user
  has_many :services
  has_many :locations
  has_many :categories
  has_one :type_subscription
  
  def profile_photo
    if object.profile_photo.attached?
      {
        url: rails_blob_url(object.profile_photo)
      }
    end
  end

end
