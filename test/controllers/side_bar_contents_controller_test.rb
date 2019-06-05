require 'test_helper'

class SideBarContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @side_bar_content = side_bar_contents(:one)
  end

  test "should get index" do
    get side_bar_contents_url
    assert_response :success
  end

  test "should get new" do
    get new_side_bar_content_url
    assert_response :success
  end

  test "should create side_bar_content" do
    assert_difference('SideBarContent.count') do
      post side_bar_contents_url, params: { side_bar_content: {  } }
    end

    assert_redirected_to side_bar_content_url(SideBarContent.last)
  end

  test "should show side_bar_content" do
    get side_bar_content_url(@side_bar_content)
    assert_response :success
  end

  test "should get edit" do
    get edit_side_bar_content_url(@side_bar_content)
    assert_response :success
  end

  test "should update side_bar_content" do
    patch side_bar_content_url(@side_bar_content), params: { side_bar_content: {  } }
    assert_redirected_to side_bar_content_url(@side_bar_content)
  end

  test "should destroy side_bar_content" do
    assert_difference('SideBarContent.count', -1) do
      delete side_bar_content_url(@side_bar_content)
    end

    assert_redirected_to side_bar_contents_url
  end
end
