ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
	# Run tests in parallel with specified workers
	parallelize(workers: :number_of_processors)

	# Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
	fixtures :all

	# Add more helper methods to be used by all tests here...
	def sign_in_as(user)
		post login_path,
		     params: {
				session: {
					email: user.email,
					password: 'password',
				},
		     }
	end

	def create_admin
		User.create(
			username: 'adminuser',
			email: 'adminuser@gmail.com',
			password: 'password',
			admin: true,
		)
	end

	def create_user
		User.create(username: 'user', email: 'user@gmail.com', password: 'password')
	end

	def assert_match_alerts
		assert_match 'error', response.body
		assert_select 'div.alert'
		assert_select 'h4.alert-heading'
	end
end
