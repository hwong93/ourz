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
Relationship.destroy_all
Comment.destroy_all
Like.destroy_all



User.create!({
  first_name: 'Mark',
  last_name: 'Wong',
  bio: 'bla',
  email: 'mark@gmail.com',
  password: 'test',
  password_confirmation: 'test',
  profile_pic: 'http://houtaiwong.com/img/profile.jpg'
  })

User.create!({
  first_name: 'Hou',
  last_name: 'Wong',
  bio: 'bla',
  email: 'test@gmail.com',
  password: 'test',
  password_confirmation: 'test',
  profile_pic: 'https://pmcdeadline2.files.wordpress.com/2016/02/alicia-vikander-the-danish-girl.jpg'
})

Category.create!({
  name: 'Music'
})

Category.create!({
  name: 'Blog'
})

Category.create!({
  name: 'Video'
})

Category.create!({
  name: 'Picture'
  })

Post.create!({
  title: 'Music',
  content: 'text',
  author: User.find_by(first_name: 'Mark').id,
  category_id: Category.find_by(name: 'Music').id,
  end_time: '12/1/2016',
  image: 'https://pmcdeadline2.files.wordpress.com/2016/02/alicia-vikander-the-danish-girl.jpg'
})

Post.create!({
  title: 'Video',
  content: 'text2',
  author: User.find_by(first_name: 'Mark').id,
  category_id: Category.find_by(name: 'Video').id,
  end_time: '12/1/2016',
  image: 'https://pmcdeadline2.files.wordpress.com/2016/02/alicia-vikander-the-danish-girl.jpg'
})

Post.create!({
  title: 'Blog',
  content: 'text2',
  author: User.find_by(first_name: 'Mark').id,
  category_id: Category.find_by(name: 'Blog').id,
  end_time: '12/1/2016',
  image: 'https://pmcdeadline2.files.wordpress.com/2016/02/alicia-vikander-the-danish-girl.jpg'
})

Post.create!({
  title: 'Picture',
  content: 'text2',
  author: User.find_by(first_name: 'Mark').id,
  category_id: Category.find_by(name: 'Picture').id,
  end_time: '12/1/2016',
  image: 'https://pmcdeadline2.files.wordpress.com/2016/02/alicia-vikander-the-danish-girl.jpg'
})


Relationship.create!({
  follower_id: User.find_by(first_name: 'Hou').id,
  followed_id: User.find_by(first_name: 'Mark').id
  })

Comment.create!({
  comment: 'blah blah blah blah',
  post_id: Post.find_by(title: 'test').id,
  user_id: User.find_by(first_name: 'Hou').id
  })

Like.create!({
  post_id: Post.find_by(title: 'test').id,
  user_id: User.find_by(first_name: 'Hou').id
  })
