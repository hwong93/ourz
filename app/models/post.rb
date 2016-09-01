class Post < ActiveRecord::Base
  belongs_to :user, foreign_key: :author
  belongs_to :category

  has_many :comments
  has_many :comment_users, through: :comments, source: 'user'

  mount_uploader :image, ImageUploader
end
