class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :author
      t.integer :category_id
      t.datetime :end_time

      t.timestamps null: false
    end
  end
end
