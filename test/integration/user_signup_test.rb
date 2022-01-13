require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
	# test "the truth" do
	#   assert true
	# end
	setup do
		User.create(
			username: 'Edouser',
			email: 'Edo@gmail.com',
			password: 'password',
		)
	end

	test 'Get the new user form and redirect after creating user' do
		get '/signup'
		assert_response :success
		assert_difference 'User.count', 1 do
			post users_path,
			     params: {
					user: {
						username: 'usuarionuevo',
						email: 'nuevousuario@test.com',
						password: 'password',
					},
			     }
			assert_response :redirect
		end
		follow_redirect!
		assert_response :success
		assert_match 'usuarionuevo', response.body
	end

	test 'get signup form and reject invalid user creation' do
		get '/signup'
		assert_response :success
		assert_no_difference 'User.count' do
			post users_path params: {
						user: {
							username: 'Edouser',
							email: 'randomemail@gmail.com',
							password: 'password',
						},
			                }
		end
		assert_match_alerts
	end

	# 	test 'must not create user if email is not unique' do
	# 	end

	# 	test 'must login after sign-up' do
	# 	end
end
