# assigns is now extracted to a gem and requires gemfile install to use 

require 'test_helper'

class MoviessControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movie = movies(:first_movie)
  end
  
  teardown do
    Rails.cache.clear
  end

  test "get index" do
    get '/movies'
    assert_response :success
    assert_not_nil assigns(:movies)
  end

  test "get show" do
    get "/movies/#{@movie.id}"
    assert_response :success
    assert_not_nil assigns(:movie)
  end

  test "get edit" do
    get "/movies/#{@movie.id}/edit"
    assert_response :success
    assert_not_nil assigns(:movie)
  end

  test "destroy the movie" do
    assert_difference('Movie.count', -1) do
      delete "/movies/#{@movie.id}"
    end
    assert_redirected_to '/movies'
  end
end