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
    @category = Category.find(@article.category_id)
    if @article.category_id == 3
      @spotify = RSpotify::Album.search(@article.title)[0].id
    end

  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if params[:article][:ranking]
      @article.update(ranking: params[:article][:ranking])
      redirect_to root_path
    else
      @article.update(market_update_params)
      redirect_to article_path
    end
  end

  private

  def market_update_params
    params.require(:article).permit(:title, :author, :description, :photo)
  end
end
