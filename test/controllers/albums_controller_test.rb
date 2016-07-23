require 'test_helper'

class AlbumsControllerTest < ActionDispatch::IntegrationTest
  

  test "should get index" do
    get '/albums'
    assert_response :success
  end
end
