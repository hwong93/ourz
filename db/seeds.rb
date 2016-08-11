# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Post.destroy_all
Category.destroy_all
Following.destroy_all


User.create!({
  first_name: 'Mark',
  last_name: 'Wong',
  bio: 'bla',
  email: 'mark@gmail.com',
  password: 'test',
  password_confirmation: 'test'
  })

User.create!({
  first_name: 'Hou',
  last_name: 'Wong',
  bio: 'bla',
  email: 'test@gmail.com',
  password: 'test',
  password_confirmation: 'test'
})

Category.create!({
  name: 'Music'
})

Post.create!({
  title: 'test',
  content: 'text',
  author: User.find_by(first_name: 'Mark').id,
  category_id: Category.find_by(name: 'Music').id,
  end_time: '12/1/2016'
})

Following.create!({
  following_user_id: User.find_by(first_name: 'Mark').id,
  follower_user_id: User.find_by(first_name: 'Hou').id,
  follow_back: false
})
