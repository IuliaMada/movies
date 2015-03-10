class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_lists
  has_many :comments
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  # require 'carrierwave/processing/rmagick'
  mount_uploader :image, ImageUploader
end
