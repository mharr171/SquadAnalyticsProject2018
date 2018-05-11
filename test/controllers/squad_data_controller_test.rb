require 'test_helper'

class SquadDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @squad_datum = squad_data(:one)
  end

  test "should get index" do
    get squad_data_url
    assert_response :success
  end

  test "should get new" do
    get new_squad_datum_url
    assert_response :success
  end

  test "should create squad_datum" do
    assert_difference('SquadDatum.count') do
      post squad_data_url, params: { squad_datum: { load_squad_data: @squad_datum.load_squad_data, update_squad_data: @squad_datum.update_squad_data, user_id: @squad_datum.user_id } }
    end

    assert_redirected_to squad_datum_url(SquadDatum.last)
  end

  test "should show squad_datum" do
    get squad_datum_url(@squad_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_squad_datum_url(@squad_datum)
    assert_response :success
  end

  test "should update squad_datum" do
    patch squad_datum_url(@squad_datum), params: { squad_datum: { load_squad_data: @squad_datum.load_squad_data, update_squad_data: @squad_datum.update_squad_data, user_id: @squad_datum.user_id } }
    assert_redirected_to squad_datum_url(@squad_datum)
  end

  test "should destroy squad_datum" do
    assert_difference('SquadDatum.count', -1) do
      delete squad_datum_url(@squad_datum)
    end

    assert_redirected_to squad_data_url
  end
end
