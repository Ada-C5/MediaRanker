require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get movies" do
    get :movies
    assert_response :success
  end

  test "should get books" do
    get :books
    assert_response :success
  end

  test "should get albums" do
    get :albums
    assert_response :success
  end

  test "should get show" do
    article = Article.first
    get :show, {id: article.id}
    assert_response :success
  end

  test "should get edit" do

    id = Article.first.id
    get :edit, id: id
    assert_response :success

  end

  test "should get update an article" do
    id = Article.first.id
    patch :update, id: id, article: { title: "Maria llena eres de gracia", description: "This is a test", author: "Awsome Programmer" }
    assert_redirected_to article_path(id)
  end

  test "should get update an upvote" do
    id = Article.first.id
    params = {
      article: {
        ranking: 2
      }
    }
    patch :update, id: id, article: { ranking: params[:article][:ranking] }
    assert_redirected_to root_path(id)
  end

  test "should get destroy" do
    id = Article.first.id
    delete :destroy, id: id
    assert_response :redirect
  end

end
