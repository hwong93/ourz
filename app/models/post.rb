class Post < ActiveRecord::Base
  require 'time'

  belongs_to :user, foreign_key: :author
  belongs_to :category

  has_many :comments
  has_many :comment_users, through: :comments, source: 'user'

  has_many :likes
  has_many :like_users, through: :likes, source: 'user'

  validates :title, presence: true
  validate :one_post

  mount_uploader :image, ImageUploader

  # geocoded_by :full_street_address   # can also be an IP address
  # after_validation :geocode          # auto-fetch coordinates

  # before_create :only_one
  #
  # private
  # def only_one
  #
  # end

  def one_post
    last_post_time = user.posts.last.created_at
    time_now = Time.now

    difference = (time_now - last_post_time).to_i / 1.day

    if difference < 1
      errors.add(:post, "You have already created a post today")
    end

  end

end
