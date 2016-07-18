require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  # called before every single test
  setup do
    @book = books(:book_one)
  end
 
  # called after every single test
  teardown do
    # when controller is using cache it may be a good idea to reset it afterwards
    Rails.cache.clear
  end

  test "should get index" do
    get '/books'
    assert_response :success
    assert_not_nil assigns(:books)
  end

  test "should get show" do
    get "/books/#{@book.id}"
    assert_response :success
    assert_not_nil assigns(:book)
  end

  test "should get new" do
    get "/books/new"
    assert_response :success
    assert_not_nil assigns(:book)
  end

  test "should get edit" do
    get "/books/#{@book.id}/edit"
    assert_response :success
    assert_not_nil assigns(:book)
  end

  test "should get upvote" do
    put "/books/#{@book.id}/upvote"
    assert_not_nil assigns(:book)
    assert_redirected_to '/books'
  end

  test "should destroy the book" do
    assert_difference('Book.count', -1) do
      delete "/books/#{@book.id}"
    end

    assert_redirected_to '/books'
  end

  test "should update book if title is present" do
    patch "/books/#{@book.id}", params: { book: { title: "updated" } }
    assert_redirected_to '/books'
    # Reload association to fetch updated data and assert that title is updated.
    @book.reload
    assert_equal "updated", @book.title
  end

  test "should NOT update book if title is removed" do
    patch "/books/#{@book.id}", params: { book: { title: "" } }
    # Reload association to fetch updated data and assert that title is updated.
    @book.reload
    assert_equal "Book One", @book.title
  end

  test "should create book if title is given" do
    assert_difference('Book.count', 1) do
      post "/books", params: { book: { title: "new book" } }
    end
    assert_redirected_to '/books'
  end

  test "should NOT create book if title is NOT given" do
    assert_no_difference('Book.count') do
      post "/books", params: { book: { title: "" } }
    end
  end
end
