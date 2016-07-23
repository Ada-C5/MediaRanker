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

  test "get new" do
    get "/movies/new"
    assert_response :success
    assert_not_nil assigns(:movie)
  end

  test "get edit" do
    get "/movies/#{@movie.id}/edit"
    assert_response :success
    assert_not_nil assigns(:movie)
  end

  test "route to rank" do
    put "/movies/#{@movie.id}/rank"
    assert_response :redirect
    assert_not_nil assigns(:movie)
  end
  
  test "destroy the movie" do
    assert_difference('Movie.count', -1) do
      delete "/movies/#{@movie.id}"
    end
    assert_redirected_to '/movies'
  end

  test "should create movie if title is given" do
    assert_difference('Movie.count', 1) do
      post "/movies", params: { movie: { title: "All Tomorrow's Parties" } }
    end
    assert_redirected_to '/movies'
  end

  test "should NOT create movie if title is NOT given" do
    assert_no_difference('Movie.count') do
      post "/movies", params: { movie: { title: "" } }
    end
  end

  test "update movie if title is present" do
    patch "/movies/#{@movie.id}", params: { movie: { title: "Ghostbusters" } }
    assert_redirected_to '/movies'
    @movie.reload
    assert_equal "Ghostbusters", @movie.title
  end

  test "should NOT update movie if title is removed" do
    patch "/movies/#{@movie.id}", params: { movie: { title: "" } }
    @movie.reload
    assert_equal "Mad Max: Fury Road", @movie.title
  end
end