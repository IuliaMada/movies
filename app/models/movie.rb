class Movie < ActiveRecord::Base
	has_and_belongs_to_many :genres
	has_many :user_lists
	has_many :comments
	validates :title, uniqueness: true
	acts_as_votable

	def self.search_db(query)
    where("title like ?","%#{query}%")
  end
end
