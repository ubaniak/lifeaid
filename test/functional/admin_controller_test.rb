require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get newsletter" do
    get :newsletter
    assert_response :success
  end

  test "should get projects" do
    get :projects
    assert_response :success
  end

  test "should get gallery" do
    get :gallery
    assert_response :success
  end

end
