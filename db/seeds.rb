# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Page.create(
	title: 'Home',
	body: '<h2> Home Page </h2> <P> Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
	Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, </p>'
	)

Block.create(
	title: 'Header Block',
	body: '<h2>Welcome</h2> <p> This is Header Blcok</p>',
	block_position: 'Top',
	block_class: 'seed-default'
	)
	
PageBlock.create(
	page_id: 1,
	block_id: 1
	
	)

Setting.create(
	site_title: 'PuLo',
	title: 'setting'
	)
	
	user = User.new(
	username: 'PuLo Admin',
  email: 'admin@domain.com', 
  password: 'password', 
  password_confirmation: 'password',
  admin: 'true'
)
user.save!




