require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  def setup
    @book = books(:first_book)
  end

  def teardown
    @book = nil
  end

  test "should get index" do
    get '/books/'
    assert_response :success
  end

  test "should show deets for specific book" do
    get "/books/#{@book.id}"
  end

  test "should be able to make new book" do
    get "/books/new"
    assert_response :success
  end

  test "should find edit page" do
    get "/books/#{@book.id}/edit"
    assert_response :success
  end

  test "should be able to upvote book" do
    patch "/books/#{@book.id}/upvote"
    assert_redirected_to "/books/#{@book.id}"
  end

  test "should delete book" do
    assert_difference('Book.count', -1) do
      delete "/books/#{@book.id}"
    end

    assert_redirected_to '/books'
  end

  test 'should be able to create new book' do
    assert_difference ('Book.count') do
      post "/books", params: {name: "new book here, coming through"}
    end
    @last_book = Book.last
    assert_redirected_to "/books/#{@last_book.id}"
  end


  test "should update book" do
    patch "/books/#{@book.id}", params: { book: { name: "new name" } }
    assert_redirected_to "/books/#{@book.id}"
    @book.reload
    assert_equal "new name", @book.name
  end
end
