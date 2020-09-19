require 'test_helper'

class EscortProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @escort_profile = escort_profiles(:one)
  end

  test "should get index" do
    get escort_profiles_url, as: :json
    assert_response :success
  end

  test "should create escort_profile" do
    assert_difference('EscortProfile.count') do
      post escort_profiles_url, params: { escort_profile: { age: @escort_profile.age, city: @escort_profile.city, description: @escort_profile.description, first_namee: @escort_profile.first_namee, last_name: @escort_profile.last_name, locations_id: @escort_profile.locations_id, photos: @escort_profile.photos, price: @escort_profile.price, profile_photog: @escort_profile.profile_photog, schedule: @escort_profile.schedule, services_id: @escort_profile.services_id, sex: @escort_profile.sex, stars: @escort_profile.stars, subscriptio: @escort_profile.subscriptio, type_subscriptions_id: @escort_profile.type_subscriptions_id, users_id: @escort_profile.users_id, verified: @escort_profile.verified } }, as: :json
    end

    assert_response 201
  end

  test "should show escort_profile" do
    get escort_profile_url(@escort_profile), as: :json
    assert_response :success
  end

  test "should update escort_profile" do
    patch escort_profile_url(@escort_profile), params: { escort_profile: { age: @escort_profile.age, city: @escort_profile.city, description: @escort_profile.description, first_namee: @escort_profile.first_namee, last_name: @escort_profile.last_name, locations_id: @escort_profile.locations_id, photos: @escort_profile.photos, price: @escort_profile.price, profile_photog: @escort_profile.profile_photog, schedule: @escort_profile.schedule, services_id: @escort_profile.services_id, sex: @escort_profile.sex, stars: @escort_profile.stars, subscriptio: @escort_profile.subscriptio, type_subscriptions_id: @escort_profile.type_subscriptions_id, users_id: @escort_profile.users_id, verified: @escort_profile.verified } }, as: :json
    assert_response 200
  end

  test "should destroy escort_profile" do
    assert_difference('EscortProfile.count', -1) do
      delete escort_profile_url(@escort_profile), as: :json
    end

    assert_response 204
  end
end
