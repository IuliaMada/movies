module MoviesHelper

	def add_movie_to_db(rezult)
		rezult.each do |r|
			movie = Movie.create(title: r['title']+" "+ r['year'],
									poster: r['urlPoster'],
									duration: r['runtime'][0],
									imdb_rating: r['rating'],
									year: r['year'],
									plot: r['plot'],
									countries: r['countries']
									)

			genres = r['genres']	
				genres.each do |gen|
					movie.genres << Genre.where(category: gen)
				end
		end
	end

	def add_genres_to_db(rez)
		rez.each do |r|
			genre = r['genres']
				genre.each do |g|
					Genre.create(category: g)
				end
		end
	end

	def all_category
		genres = Genre.all
		categories = [] 
			genres.each do |gen|
				categories << [gen.category]
			end
		categories
		end

	def search_category(gen)
		ob_gen = Genre.find_by(category: gen)
		all_movies = ob_gen.movies
	end
	def lists_user(user_id)
		all_movies = UserList.where(user_id: user_id).map{|list| list.movie_id}
		all_movies
	end
end


	


