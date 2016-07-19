def upvote
  @movie = Movie.find(params[:id])
  @movie.votes.create
  redirect_to(movies_path)
end
