class Movie < ActiveRecord::Base
	has_and_belongs_to_many :genres
	has_many :user_lists
	validates :title, uniqueness: true


	def self.search_db(query)
    where("title like ?","%#{query}%")
  end
end
