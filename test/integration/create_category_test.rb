require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest
	setup do
		@admin_user = create_admin
		sign_in_as(@admin_user)
	end
	test 'Get the new category form and creating category' do
		get '/categories/new'
		assert_response :success
		assert_difference 'Category.count', 1 do
			post categories_path, params: { category: { name: 'Sports' } }
			assert_response :redirect
		end
		follow_redirect!
		assert_response :success
		assert_match 'Sports', response.body
	end

	test 'Get the new category form and reject invalid category submission' do
		get '/categories/new'
		assert_response :success
		assert_no_difference 'Category.count' do
			post categories_path, params: { category: { name: ' ' } }
		end

		assert_match_alerts
	end
end
