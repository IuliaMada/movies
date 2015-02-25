class Movie < ActiveRecord::Base
	validates :title, uniqueness: true
		

	def self.search_db(query)
    where("title like ?","%#{query}%")
	end

end
