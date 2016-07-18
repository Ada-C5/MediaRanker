require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "validations: title can't be blank" do
    movie = Movie.new

    assert_not movie.valid?
    assert movie.errors.keys.include?(:title), "title is not in the errors hash"
  end

  test "validations: upvotes is 0 by default" do
    movie = Movie.new

    assert_equal(0, movie.upvotes)
  end

  test "validations: upvotes must be an integer, not a string" do
    movie = Movie.new(upvotes: 'upvotes')

    assert_not movie.valid?
    assert movie.errors.keys.include?(:upvotes), "upvotes is not in the errors hash"
  end

  test "validations: ActiveRecord turns a number string into a number" do
    movie = Movie.new(upvotes: '100')

    assert movie.upvotes, 100
  end

  test "validations: upvotes must be an integer, not a float" do
    movie = Movie.new(upvotes: 100.5)

    assert_not movie.valid?
    assert movie.errors.keys.include?(:upvotes), "upvotes is not in the errors hash"
  end
end
