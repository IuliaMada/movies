class UsersController < ApplicationController
	before_action :user_signed_in?, only: [:index, :following, :followers]
  require 'will_paginate/array'                                  
  def index
		@users = User.paginate(:page => params[:page],:per_page => 24)
	end

  def show
    @user = User.includes(:user_lists).find(params[:id])
      vazute = @user.user_lists.where(status: true).map{|l| Movie.find(l.movie_id)}
      de_vazut = @user.user_lists.where(status: false).map{|l| Movie.find(l.movie_id)}
    @vazute = vazute.paginate(:page => params[:page],:per_page => 9)
    @de_vazut = de_vazut.paginate(:page => params[:page],:per_page => 9)


    @feeds = current_user.feed
    @feed_items = @feeds.order(updated_at: :desc).paginate(:page => params[:page],:per_page => 13) 
    @users = User.all.paginate(:page => params[:page],:per_page => 11) 
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
