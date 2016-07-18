require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    article = Article.first
    get :show, {id: article.id}
    assert_response :success
  end

  # test "should get delete" do
  #   get :destroy
  #   assert_response :success
  # end
  #
  # test "should get update" do
  #   get :update
  #   assert_response :success
  # end

end
