class ArticlesController < ApplicationController

  def index
    @movies = Article.where(category_id: 1).order(ranking: :desc)
    @books = Article.where(category_id: 2).order(ranking: :desc)
    @albums = Article.where(category_id: 3).order(ranking: :desc)
  end

  def movies
    @articles = Article.where(category_id: 1).order(ranking: :desc)
  end

  def books
    @articles = Article.where(category_id: 2).order(ranking: :desc)
  end

  def albums
    @articles = Article.where(category_id: 3).order(ranking: :desc)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def delete
  end

  def update
    @article = Article.find(params[:id])
    @article.update(ranking: params[:article][:ranking])
    redirect_to root_path
  end
end
