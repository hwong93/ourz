class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true

  has_many :posts, foreign_key: :author
  has_many :following, class_name: 'Following', foreign_key: :following_user_id
  has_many :followers, class_name: 'Following', foreign_key: :follower_user_id

end
