require 'test_helper'

class AlbumsControllerTest < ActionDispatch::IntegrationTest
  # called before every single test
  setup do
    @album = albums(:album_one)
  end
 
  # called after every single test
  teardown do
    # when controller is using cache it may be a good idea to reset it afterwards
    Rails.cache.clear
  end

  test "should get index" do
    get '/albums'
    assert_response :success
    assert_not_nil assigns(:albums)
  end

  test "should get show" do
    get "/albums/#{@album.id}"
    assert_response :success
    assert_not_nil assigns(:album)
  end

  test "should get new" do
    get "/albums/new"
    assert_response :success
    assert_not_nil assigns(:album)
  end

  test "should get edit" do
    get "/albums/#{@album.id}/edit"
    assert_response :success
    assert_not_nil assigns(:album)
  end

  test "should get upvote" do
    put "/albums/#{@album.id}/upvote"
    assert_not_nil assigns(:album)
    assert_redirected_to '/albums'
  end

  test "should destroy the album" do
    assert_difference('Album.count', -1) do
      delete "/albums/#{@album.id}"
    end

    assert_redirected_to '/albums'
  end

  test "should update album if title is present" do
    patch "/albums/#{@album.id}", params: { album: { title: "updated" } }
    assert_redirected_to '/albums'
    # Reload association to fetch updated data and assert that title is updated.
    @album.reload
    assert_equal "updated", @album.title
  end

  test "should NOT update album if title is removed" do
    patch "/albums/#{@album.id}", params: { album: { title: "" } }
    # Reload association to fetch updated data and assert that title is updated.
    @album.reload
    assert_equal "Album One", @album.title
  end

  test "should create album if title is given" do
    assert_difference('Album.count', 1) do
      post "/albums", params: { album: { title: "new album" } }
    end
    assert_redirected_to '/albums'
  end

  test "should NOT create album if title is NOT given" do
    assert_no_difference('Album.count') do
      post "/albums", params: { album: { title: "" } }
    end
  end
end
