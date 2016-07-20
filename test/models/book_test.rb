require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "should save a new instance of book with title" do
    book = Book.new
    book.name = "Test Book"
    assert book.save
  end

  test "should not save a new instance of book without title" do
    book = Book.new
    assert_not book.save
  end

end
