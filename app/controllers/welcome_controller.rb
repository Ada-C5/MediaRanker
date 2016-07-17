class WelcomeController < ApplicationController
  def index
    @movies = Article.where(category_id: 1)
    @books = Article.where(category_id: 2)
    @albums = Article.where(category_id: 3)
  end
end
