require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "should save a new instance of movie with title" do
    movie = Movie.new
    movie.name = "Test Movie"
    assert movie.save
  end

  test "should not save a new instance of movie without title" do
    movie = Movie.new
    assert_not movie.save
  end
end
