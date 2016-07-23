# assigns is now extracted to a gem and requires gemfile install to use 
# .reload reloads the records from the database. Easy way to check for changes. (http://apidock.com/rails/ActiveRecord/Persistence/reload) 

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

  test "should create album if title is given" do
    assert_difference('Album.count', 1) do
      post "/albums", params: { album: { title: "Morning Phase" } }
    end
    assert_redirected_to '/albums'
  end

  test "should NOT create album if title is NOT given" do
    assert_no_difference('Album.count') do
      post "/albums", params: { album: { title: "" } }
    end
  end

  test "update album if title is present" do
    patch "/albums/#{@album.id}", params: { album: { title: "In Rainbows" } }
    assert_redirected_to '/albums'
    @album.reload
    assert_equal "In Rainbows", @album.title
  end

  test "should NOT update album if title is removed" do
    patch "/albums/#{@album.id}", params: { album: { title: "" } }
    @album.reload
    assert_equal "The Bends", @album.title
  end
end
