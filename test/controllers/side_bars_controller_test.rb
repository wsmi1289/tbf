require 'test_helper'

class SideBarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @side_bar = side_bars(:one)
  end

  test "should get index" do
    get side_bars_url
    assert_response :success
  end

  test "should get new" do
    get new_side_bar_url
    assert_response :success
  end

  test "should create side_bar" do
    assert_difference('SideBar.count') do
      post side_bars_url, params: { side_bar: {  } }
    end

    assert_redirected_to side_bar_url(SideBar.last)
  end

  test "should show side_bar" do
    get side_bar_url(@side_bar)
    assert_response :success
  end

  test "should get edit" do
    get edit_side_bar_url(@side_bar)
    assert_response :success
  end

  test "should update side_bar" do
    patch side_bar_url(@side_bar), params: { side_bar: {  } }
    assert_redirected_to side_bar_url(@side_bar)
  end

  test "should destroy side_bar" do
    assert_difference('SideBar.count', -1) do
      delete side_bar_url(@side_bar)
    end

    assert_redirected_to side_bars_url
  end
end
