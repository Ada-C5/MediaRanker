# assigns is now extracted to a gem and requires gemfile install to use 

require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:first_book)
  end
  
  teardown do
    Rails.cache.clear
  end

  test "get index" do
    get '/books'
    assert_response :success
    assert_not_nil assigns(:books)
  end

  test "get show" do
    get "/books/#{@book.id}"
    assert_response :success
    assert_not_nil assigns(:book)
  end

  test "get new" do
    get "/books/new"
    assert_response :success
    assert_not_nil assigns(:book)
  end

  test "get edit" do
    get "/books/#{@book.id}/edit"
    assert_response :success
    assert_not_nil assigns(:book)
  end

  test "route to rank" do
    put "/books/#{@book.id}/rank"
    assert_response :redirect
    assert_not_nil assigns(:book)
  end

  test "destroy the book" do
    assert_difference('Book.count', -1) do
      delete "/books/#{@book.id}"
    end
    assert_redirected_to '/books'
  end

  test "should create book if title is given" do
    assert_difference('Book.count', 1) do
      post "/books", params: { book: { title: "All Tomorrow's Parties" } }
    end
    assert_redirected_to '/books'
  end

  test "should NOT create book if title is NOT given" do
    assert_no_difference('Book.count') do
      post "/books", params: { book: { title: "" } }
    end
  end

  test "update book if title is present" do
    patch "/books/#{@book.id}", params: { book: { title: "Idoru" } }
    assert_redirected_to '/books'
    @book.reload
    assert_equal "Idoru", @book.title
  end

  test "should NOT update book if title is removed" do
    patch "/books/#{@book.id}", params: { book: { title: "" } }
    @book.reload
    assert_equal "Into the Wild", @book.title
  end
end