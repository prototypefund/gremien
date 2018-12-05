require 'test_helper'

class RatingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rating = ratings(:one)
  end

  test "should get index" do
    get ratings_url
    assert_response :success
  end

  test "should get new" do
    get new_rating_url
    assert_response :success
  end

  test "should create rating" do
    assert_difference('Rating.count') do
      post ratings_url, params: { rating: { entity_id: @rating.entity_id, kind: @rating.kind, option1: @rating.option1, option2: @rating.option2, option3: @rating.option3, status: @rating.status, token: @rating.token, visitor_id: @rating.visitor_id } }
    end

    assert_redirected_to rating_url(Rating.last)
  end

  test "should show rating" do
    get rating_url(@rating)
    assert_response :success
  end

  test "should get edit" do
    get edit_rating_url(@rating)
    assert_response :success
  end

  test "should update rating" do
    patch rating_url(@rating), params: { rating: { entity_id: @rating.entity_id, kind: @rating.kind, option1: @rating.option1, option2: @rating.option2, option3: @rating.option3, status: @rating.status, token: @rating.token, visitor_id: @rating.visitor_id } }
    assert_redirected_to rating_url(@rating)
  end

  test "should destroy rating" do
    assert_difference('Rating.count', -1) do
      delete rating_url(@rating)
    end

    assert_redirected_to ratings_url
  end
end
