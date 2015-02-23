class MoviesController < ApplicationController
  def index
  	
  	# @respons = HTTParty.get("http://myapifilms.com/imdb?title=#{params[:movie_title].gsub(' ', '%20')}&limit=10&year=#{params[:year]}&filter=#{params[:category]}")
  	response = HTTParty.get("http://myapifilms.com/imdb?title=#{params[:movie_title].gsub(' ', '%20')}&limit=10")
  	# @result = HTTParty::Parser.call(response.body, :json)
      @movies_result = JSON.parse(response)
   

  end
end
