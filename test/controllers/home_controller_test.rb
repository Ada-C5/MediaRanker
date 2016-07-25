require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "get root path" do
    get '/'
    assert_response :success
    assert_not_nil assigns(:books)
    assert_not_nil assigns(:albums)
    assert_not_nil assigns(:movies)
  end
end
