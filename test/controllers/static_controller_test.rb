require 'test_helper'

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get static_index_url
    assert_response :success
  end

  test "should get about" do
    get static_about_url
    assert_response :success
  end

  test "should get blog" do
    get static_blog_url
    assert_response :success
  end

  test "should get blog-single" do
    get static_blog-single_url
    assert_response :success
  end

  test "should get contact" do
    get static_contact_url
    assert_response :success
  end

  test "should get doctors" do
    get static_doctors_url
    assert_response :success
  end

  test "should get services" do
    get static_services_url
    assert_response :success
  end

end
