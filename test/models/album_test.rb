require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "validations: title can't be blank" do
    album = Album.new

    assert_not album.valid?
    assert album.errors.keys.include?(:title), "title is not in the errors hash"
  end

  test "validations: upvotes is 0 by default" do
    album = Album.new

    assert_equal(0, album.upvotes)
  end

  test "validations: upvotes must be an integer, not a string" do
    album = Album.new(upvotes: 'upvotes')

    assert_not album.valid?
    assert album.errors.keys.include?(:upvotes), "upvotes is not in the errors hash"
  end

  test "validations: ActiveRecord turns a number string into a number" do
    album = Album.new(upvotes: '100')

    assert album.upvotes, 100
  end

  test "validations: upvotes must be an integer, not a float" do
    album = Album.new(upvotes: 100.5)

    assert_not album.valid?
    assert album.errors.keys.include?(:upvotes), "upvotes is not in the errors hash"
  end    
end
