class Post < ActiveRecord::Base
  belongs_to :user, foreign_key: :author
  belongs_to :category

  has_many :comments
  has_many :comment_users, through: :comments, source: 'user'

  has_many :likes
  has_many :like_users, through: :likes, source: 'user'

  mount_uploader :image, ImageUploader

  # before_create :only_one
  #
  # private
  # def only_one
  #
  # end

end
