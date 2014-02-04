# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
	{
		username: 'newenegue',
		first_name: 'Eugene',
		last_name: 'Wen',
		email: 'newenegue@gmail.com',
		blog_name: 'newenegue'
	},
	{
		username: 'stephyiwen',
		first_name: 'Stephanie',
		email: 'stephyiwen@gmail.com',
		blog_name: 'Martini Shot LA'
	}
	])

posts = Post.create([
	{
		title: 'newenegue first blog',
		body: 'This is my first blog post on newenegue blog'
	},
	{
		title: 'newenegue second blog',
		body: 'This is my second blog post on newenegue blog'
	},
	{
		title: 'Martini Shot LA first blog',
		body: 'This is my first blog post on Martini Shot LA blog'
	}
	])

# comments = Comment.create([
# 	{
		
# 	}
# 	])