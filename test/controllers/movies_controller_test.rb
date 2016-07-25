require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @movie = movies(:first_movie)
  end

  def teardown
    @movie = nil
  end

  test "should get index" do
    get '/movies/'
    assert_response :success
  end

  test "should show deets for specific movie" do
    get "/movies/#{@movie.id}"
  end

  test "should be able to make new movie" do
    get "/movies/new"
    assert_response :success
  end

  test "should find edit page" do
    get "/movies/#{@movie.id}/edit"
    assert_response :success
  end

  test "should be able to upvote movie" do
    patch "/movies/#{@movie.id}/upvote"
    assert_redirected_to "/movies/#{@movie.id}"
  end

  test "should delete movie" do
    assert_difference('Movie.count', -1) do
      delete "/movies/#{@movie.id}"
    end

    assert_redirected_to '/movies'
  end

  test 'should be able to create new movie' do
    assert_difference ('Movie.count') do
      post "/movies", params: {name: "new_moooovie"}
    end
    assert_redirected_to "/movies/#{(@movie.id + 1)}"
  end

  test "should update movie" do
    patch "/movies/#{@movie.id}", params: { movie: { name: "new name" } }
   assert_redirected_to "/movies/#{@movie.id}"
   @movie.reload
   assert_equal "new name", @movie.name
  end

end
