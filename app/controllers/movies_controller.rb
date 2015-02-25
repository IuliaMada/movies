class MoviesController < ApplicationController
	include MoviesHelper

  def index
  	if params[:movie_title]
  		
      response = HTTParty.get("http://myapifilms.com/imdb?title=#{params[:movie_title].gsub(' ', '%20')}&limit=10")
  		@movies_result = JSON.parse(response)
      add_movie_to_db(@movies_result)

       
      @movies = Movie.search_db(params[:movie_title])
      @genre = Movie.all
    end
  end 

end
