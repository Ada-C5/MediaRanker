require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "validations: title can't be blank" do
    book = Book.new

    assert_not book.valid?
    assert book.errors.keys.include?(:title), "title is not in the errors hash"
  end

  test "validations: upvotes is 0 by default" do
    book = Book.new

    assert_equal(0, book.upvotes)
  end

  test "validations: upvotes must be an integer, not a string" do
    book = Book.new(upvotes: 'upvotes')

    assert_not book.valid?
    assert book.errors.keys.include?(:upvotes), "upvotes is not in the errors hash"
  end

  test "validations: ActiveRecord turns a number string into a number" do
    book = Book.new(upvotes: '100')

    assert book.upvotes, 100
  end

  test "validations: upvotes must be an integer, not a float" do
    book = Book.new(upvotes: 100.5)

    assert_not book.valid?
    assert book.errors.keys.include?(:upvotes), "upvotes is not in the errors hash"
  end    
end
