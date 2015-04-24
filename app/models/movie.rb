class Movie < ActiveRecord::Base
	has_and_belongs_to_many :genres
	has_many :user_lists
	has_many :comments
	validates :title, uniqueness: true
	acts_as_votable

	mount_uploader :image, ImageUploader

	# def self.search_db(query)
 #    where("title like ?","%#{query}%")
 #  end

  def self.search_db(query)
    words = query.to_s.strip.split
    words.map! { |word| "title LIKE '%#{word}%'" }
    sql = words.join(" AND ")
    self.where(sql)
  end
end
