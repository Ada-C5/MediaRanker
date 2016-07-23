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

  test "get edit" do
    get "/books/#{@book.id}/edit"
    assert_response :success
    assert_not_nil assigns(:book)
  end

  test "destroy the book" do
    assert_difference('Book.count', -1) do
      delete "/books/#{@book.id}"
    end
    assert_redirected_to '/books'
  end
end