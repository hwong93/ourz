class Like < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: :user
  # , recipient: :author

  belongs_to :user
  belongs_to :post

  # has_one :user, through: :post
end
