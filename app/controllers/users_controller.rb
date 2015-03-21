class UsersController < ApplicationController
	before_action :user_signed_in?, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]
                                        
  def index
		@users = User.all
	end

  def show
    @user = User.includes(:user_lists).find(params[:id])
    @vazute = @user.user_lists.where(status: true).map{|l| Movie.find(l.movie_id)}

    @de_vazut = @user.user_lists.where(status: false).map{|l| Movie.find(l.movie_id)}
    
    if user_signed_in?
      @feeds = current_user.feed
      @feed_items = @feeds.order(updated_at: :desc)
    end

  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
end
