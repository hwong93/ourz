class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.integer :following_user_id
      t.integer :follower_user_id
      t.boolean :follow_back, :default => false

      t.timestamps null: false
    end
  end
end
