require 'test_helper'

class ArticleCreationTest < ActionDispatch::IntegrationTest
	setup do
		@user = create_user
		sign_in_as(@user)
	end

	test 'Get article form and redirect after article creation' do
		get '/articles/new'
		assert_response :success
		assert_difference 'Article.count', 1 do
			post articles_path params: {
						article: {
							title: 'this is the title',
							description: 'this is the articles description',
							user_id: @user.id,
						},
			                   }
			assert_response :redirect
		end
		follow_redirect!
		assert_response :success
		assert_match 'this is the title', response.body
	end
end
