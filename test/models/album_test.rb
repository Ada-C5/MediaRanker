require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "should save a new instance of album with title" do
    album = Album.new
    album.name = "Test Album"
    assert album.save
  end

  test "should not save a new instance of album without title" do
    album = Album.new
    assert_not album.save
  end
end
