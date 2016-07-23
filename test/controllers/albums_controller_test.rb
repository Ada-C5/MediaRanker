# assigns is now extracted to a gem and requires gemfile install to use 

require 'test_helper'

class AlbumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @album = albums(:first_album)
  end
  
  teardown do
    Rails.cache.clear
  end

  test "get index" do
    get '/albums'
    assert_response :success
    assert_not_nil assigns(:albums)
  end

  test "get show" do
    get "/albums/#{@album.id}"
    assert_response :success
    assert_not_nil assigns(:album)
  end

  test "get edit" do
    get "/albums/#{@album.id}/edit"
    assert_response :success
    assert_not_nil assigns(:album)
  end

  test "destroy the album" do
    assert_difference('Album.count', -1) do
      delete "/albums/#{@album.id}"
    end
    assert_redirected_to '/albums'
  end
end
