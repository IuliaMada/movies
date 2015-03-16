class UsersController < ApplicationController

	def index
		@users = User.all
	end

  def show
    @user = User.includes(:user_lists).find(params[:id])
    @vazute = @user.user_lists.where(status: true).map{|l| Movie.find(l.movie_id)}

    @de_vazut = @user.user_lists.where(status: false).map{|l| Movie.find(l.movie_id)}
  end

end
