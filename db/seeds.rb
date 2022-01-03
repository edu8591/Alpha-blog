# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'destroying all previous users'
User.destroy_all
puts 'All users destroyed successfully'
puts 'Creating 30 Users'
count = 1
30.times do
	username = Faker::Name.first_name
	puts "creating user ##{count} username: #{username}"
	count += 1

	user =
		User.create!(
			username: username,
			email:
				"#{username.delete(' ') if username.include?(' ') || username}@example.com",
			password: 'password',
		)

	(1..9).to_a.sample.times do
		Article.create!(
			title: Faker::Books::Lovecraft.tome,
			description: Faker::Books::Lovecraft.sentence,
			user: user,
		)
	end
end
