require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get root path" do
    get '/'
    assert_response :success
    assert_not_nil assigns(:movies)
    assert_not_nil assigns(:books)
    assert_not_nil assigns(:albums)
  end
end
