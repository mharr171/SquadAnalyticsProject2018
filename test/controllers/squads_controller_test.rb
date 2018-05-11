require 'test_helper'

class SquadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @squad = squads(:one)
  end

  test "should get index" do
    get squads_url
    assert_response :success
  end

  test "should get new" do
    get new_squad_url
    assert_response :success
  end

  test "should create squad" do
    assert_difference('Squad.count') do
      post squads_url, params: { squad: { user_id: @squad.user_id } }
    end

    assert_redirected_to squad_url(Squad.last)
  end

  test "should show squad" do
    get squad_url(@squad)
    assert_response :success
  end

  test "should get edit" do
    get edit_squad_url(@squad)
    assert_response :success
  end

  test "should update squad" do
    patch squad_url(@squad), params: { squad: { user_id: @squad.user_id } }
    assert_redirected_to squad_url(@squad)
  end

  test "should destroy squad" do
    assert_difference('Squad.count', -1) do
      delete squad_url(@squad)
    end

    assert_redirected_to squads_url
  end
end
