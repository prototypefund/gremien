require 'test_helper'

class BodiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @body = bodies(:one)
  end

  test "should get index" do
    get bodies_url
    assert_response :success
  end

  test "should get new" do
    get new_body_url
    assert_response :success
  end

  test "should create body" do
    assert_difference('Body.count') do
      post bodies_url, params: { body: { description: @body.description, name: @body.name, owner_id: @body.owner_id, status: @body.status, token: @body.token, url: @body.url } }
    end

    assert_redirected_to body_url(Body.last)
  end

  test "should show body" do
    get body_url(@body)
    assert_response :success
  end

  test "should get edit" do
    get edit_body_url(@body)
    assert_response :success
  end

  test "should update body" do
    patch body_url(@body), params: { body: { description: @body.description, name: @body.name, owner_id: @body.owner_id, status: @body.status, token: @body.token, url: @body.url } }
    assert_redirected_to body_url(@body)
  end

  test "should destroy body" do
    assert_difference('Body.count', -1) do
      delete body_url(@body)
    end

    assert_redirected_to bodies_url
  end
end
