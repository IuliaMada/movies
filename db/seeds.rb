# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Users
# User.create!(first_name:  "Example",
# 			 last_name: "Example",
#              email: "example@railstutorial.org",
#              password:              "foobarsd",
#              password_confirmation: "foobarsd",
#              created_at: Time.zone.now)

# 99.times do |n|
#   first_name  = Faker::Name.first_name
#   last_name  = Faker::Name.last_name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(first_name: first_name,
#   			  last_name: last_name,
#               email: email,
#               password:              password,
#               password_confirmation: password,
#               created_at: Time.zone.now)
# end

# # Following relationships
# users = User.all
# user  = users.first
# following = users[2..50]
# followers = users[3..40]
# following.each { |followed| user.follow(followed) }
# followers.each { |follower| follower.follow(user) }
# n = 1
# while n < 8
# 	some_movies = [1,34,27,10,5]
# 	some_movies.each do |movie|
# 		UserList.create(status: true,
#                     user_id: n,
#                     movie_id: movie,
#                     created_at: Time.zone.now)
#  	end
# 	n+=1
# end

# m = 1
# while m < 8
# 	some_movies = [13,20,31,21]
# 	some_movies.each do |movie|
#     UserList.create(status: false,
#                     user_id: m,
#                     movie_id: movie,
#                     created_at: Time.zone.now)
#  end
# 	m+=1
# end



c = 1
while c < 8
	some_movies = [1,34,27,10,5,13,20,31,21]
	some_movies.each do |movie|
		Comment.create( user_id: c,
                    movie_id: movie,
                    body: Faker::Lorem.sentence,
                    created_at: Time.zone.now)
 	end
	c+=1
end

