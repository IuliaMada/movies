class MoviesController < ApplicationController
	include MoviesHelper

  def about
  end
  
  def index
  	if params[:movie_title].blank? && params[:genre]
      if params[:genre] == ""
        flash[:notice] = "Choose a movie by title or by genre"
        redirect_to movies_path   
      else
        movies = search_category(params[:genre])
        @movies = movies.paginate(:page => params[:page],:per_page => 15) 
      end

    elsif params[:movie_title]
      response = HTTParty.get("http://myapifilms.com/imdb?title=#{params[:movie_title].gsub(' ', '%20')}&limit=10")
  	 	@movies_result = JSON.parse(response)
      add_genres_to_db(@movies_result)
      add_movie_to_db(@movies_result)
      movies = Movie.search_db(params[:movie_title].capitalize!)
      @movies = movies.paginate(:page => params[:page],:per_page => 15) 
    end
  end 

  def show
    @movie = Movie.find(params[:id])
    @watched = UserList.where(movie_id: params[:id], status: true )
  end

  def destroy
    @user_list = UserList.find_by(user_id: current_user, movie_id: params[:id])
    @user_list.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: 'User list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    if user_signed_in?
      @movie = Movie.find(params[:id])
      @movie.liked_by current_user
      redirect_to @movie
    else
      redirect_to user_session_path  
    end
  end

  def downvote
    if user_signed_in?
      @movie = Movie.find(params[:id])
      @movie.downvote_from current_user
      redirect_to @movie
    else
      redirect_to user_session_path
    end
  end



end
