class MoviesController < ApplicationController
	include MoviesHelper

  def index
  	if params[:movie_title].blank? && params[:genre]
      if params[:genre] == "gen"
        render index
        flash[:notice] = "Choose a genre"
      end
      @movies = search_category(params[:genre])

    elsif params[:movie_title]
      response = HTTParty.get("http://myapifilms.com/imdb?title=#{params[:movie_title].gsub(' ', '%20')}&limit=10")
  	 	@movies_result = JSON.parse(response)
      add_genres_to_db(@movies_result)
      add_movie_to_db(@movies_result)
      @movies = Movie.search_db(params[:movie_title])
    end
  end 

  def show
    @movie = Movie.find(params[:id])
  end

  def destroy
    @user_list = UserList.find_by(user_id: current_user, movie_id: params[:id])
    @user_list.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: 'User list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

end
