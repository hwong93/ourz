class Post < ActiveRecord::Base
  belongs_to :user, foreign_key: :author
  belongs_to :category

  mount_uploader :image, ImageUploader
end
