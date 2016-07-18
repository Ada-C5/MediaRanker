require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  # called before every single test
  setup do
    @movie = movies(:movie_one)
  end
 
  # called after every single test
  teardown do
    # when controller is using cache it may be a good idea to reset it afterwards
    Rails.cache.clear
  end

  test "should get index" do
    get '/movies'
    assert_response :success
    assert_not_nil assigns(:movies)
  end

  test "should get show" do
    get "/movies/#{@movie.id}"
    assert_response :success
    assert_not_nil assigns(:movie)
  end

  test "should get new" do
    get "/movies/new"
    assert_response :success
    assert_not_nil assigns(:movie)
  end

  test "should get edit" do
    get "/movies/#{@movie.id}/edit"
    assert_response :success
    assert_not_nil assigns(:movie)
  end

  test "should get upvote" do
    put "/movies/#{@movie.id}/upvote"
    assert_not_nil assigns(:movie)
    assert_redirected_to '/movies'
  end

  test "should get destroy" do
    assert_difference('Movie.count', -1) do
      delete "/movies/#{@movie.id}"
    end

    assert_redirected_to '/movies'
  end

  test "should update movie if title is present" do
    patch "/movies/#{@movie.id}", params: { movie: { title: "updated" } }
    assert_redirected_to '/movies'
    # Reload association to fetch updated data and assert that title is updated.
    @movie.reload
    assert_equal "updated", @movie.title
  end

  test "should NOT update movie if title is removed" do
    patch "/movies/#{@movie.id}", params: { movie: { title: "" } }
    # Reload association to fetch updated data and assert that title is updated.
    @movie.reload
    assert_equal "Movie One", @movie.title
  end

  test "should create movie if title is given" do
    assert_difference('Movie.count', 1) do
      post "/movies", params: { movie: { title: "new movie" } }
    end
    assert_redirected_to '/movies'
  end

  test "should NOT create movie if title is NOT given" do
    assert_no_difference('Movie.count') do
      post "/movies", params: { movie: { title: "" } }
    end
  end
end
