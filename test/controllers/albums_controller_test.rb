require 'test_helper'

class AlbumsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @album = albums(:first_album)
  end

  def teardown
    @album = nil
  end

  test "should get index" do
    get '/albums/'
    assert_response :success
  end

  test "should show deets for specific album" do
    get "/albums/#{@album.id}"
  end

  test "should be able to make new album" do
    get "/albums/new"
    assert_response :success
  end

  test "should find edit page" do
    get "/albums/#{@album.id}/edit"
    assert_response :success
  end

  test "should be able to upvote album" do
    patch "/albums/#{@album.id}/upvote"
    assert_redirected_to "/albums/#{@album.id}"
  end

  test "should delete album" do
    assert_difference('Album.count', -1) do
      delete "/albums/#{@album.id}"
    end

    assert_redirected_to '/albums'
  end

  test 'should be able to create new album' do
    assert_difference ('Album.count') do
      post "/albums", params: {name: "new album here, coming through"}
    end
    @last_album = Album.last
    assert_redirected_to "/albums/#{@last_album.id}"
  end


  test "should update album" do
    patch "/albums/#{@album.id}", params: { album: { name: "new name" } }
    assert_redirected_to "/albums/#{@album.id}"
    @album.reload
    assert_equal "new name", @album.name
  end
end
