require 'test_helper'

class ProceduresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @procedure = procedures(:one)
  end

  test "should get index" do
    get procedures_url
    assert_response :success
  end

  test "should get new" do
    get new_procedure_url
    assert_response :success
  end

  test "should create procedure" do
    assert_difference('Procedure.count') do
      post procedures_url, params: { procedure: { description: @procedure.description, owner_id: @procedure.owner_id, period_id: @procedure.period_id, status: @procedure.status, submission_at: @procedure.submission_at, title: @procedure.title, token: @procedure.token, kind: @procedure.kind, url: @procedure.url, vote_date_at: @procedure.vote_date_at } }
    end

    assert_redirected_to procedure_url(Procedure.last)
  end

  test "should show procedure" do
    get procedure_url(@procedure)
    assert_response :success
  end

  test "should get edit" do
    get edit_procedure_url(@procedure)
    assert_response :success
  end

  test "should update procedure" do
    patch procedure_url(@procedure), params: { procedure: { description: @procedure.description, owner_id: @procedure.owner_id, period_id: @procedure.period_id, status: @procedure.status, submission_at: @procedure.submission_at, title: @procedure.title, token: @procedure.token, kind: @procedure.kind, url: @procedure.url, vote_date_at: @procedure.vote_date_at } }
    assert_redirected_to procedure_url(@procedure)
  end

  test "should destroy procedure" do
    assert_difference('Procedure.count', -1) do
      delete procedure_url(@procedure)
    end

    assert_redirected_to procedures_url
  end
end
