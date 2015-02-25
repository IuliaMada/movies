module MoviesHelper

	def add_movie_to_db(rezult)
		rezult.each do |r|
			Movie.create(title: r['title']+" "+ r['year'],
									poster: r['urlPoster'],
									duration: r['runtime'][0],
									genres: r['genres'].join(', '),
									imdb_rating: r['rating'],
									year: r['year'])
									
		end
	end

	def all_genres
		genre_array = []
		movies = Movie.all 
			movies.each do |m|
				genre_array << m.genres
			end	
			genre_array.uniq

			#inca nu e gata nu stiu cum sa o fac
	end
end


