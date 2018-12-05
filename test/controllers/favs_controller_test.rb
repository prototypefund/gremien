require 'test_helper'

class FavsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fav = favs(:one)
  end

  test "should get index" do
    get favs_url
    assert_response :success
  end

  test "should get new" do
    get new_fav_url
    assert_response :success
  end

  test "should create fav" do
    assert_difference('Fav.count') do
      post favs_url, params: { fav: { author_id: @fav.author_id, entity_id: @fav.entity_id } }
    end

    assert_redirected_to fav_url(Fav.last)
  end

  test "should show fav" do
    get fav_url(@fav)
    assert_response :success
  end

  test "should get edit" do
    get edit_fav_url(@fav)
    assert_response :success
  end

  test "should update fav" do
    patch fav_url(@fav), params: { fav: { author_id: @fav.author_id, entity_id: @fav.entity_id } }
    assert_redirected_to fav_url(@fav)
  end

  test "should destroy fav" do
    assert_difference('Fav.count', -1) do
      delete fav_url(@fav)
    end

    assert_redirected_to favs_url
  end
end
