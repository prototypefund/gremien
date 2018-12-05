require 'test_helper'

class ArgumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @argument = arguments(:one)
  end

  test "should get index" do
    get arguments_url
    assert_response :success
  end

  test "should get new" do
    get new_argument_url
    assert_response :success
  end

  test "should create argument" do
    assert_difference('Argument.count') do
      post arguments_url, params: { argument: { author_id: @argument.author_id, description: @argument.description, procedure_id: @argument.procedure_id, status: @argument.status, title: @argument.title, token: @argument.token, kind: @argument.kind } }
    end

    assert_redirected_to argument_url(Argument.last)
  end

  test "should show argument" do
    get argument_url(@argument)
    assert_response :success
  end

  test "should get edit" do
    get edit_argument_url(@argument)
    assert_response :success
  end

  test "should update argument" do
    patch argument_url(@argument), params: { argument: { author_id: @argument.author_id, description: @argument.description, procedure_id: @argument.procedure_id, status: @argument.status, title: @argument.title, token: @argument.token, kind: @argument.kind } }
    assert_redirected_to argument_url(@argument)
  end

  test "should destroy argument" do
    assert_difference('Argument.count', -1) do
      delete argument_url(@argument)
    end

    assert_redirected_to arguments_url
  end
end
