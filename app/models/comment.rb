class Comment < ActiveRecord::Base
  include PublicActivity::Model
  tracked except: :update

  belongs_to :user
  belongs_to :post
  has_one :author, through: :post

  def post_author

  end
end
