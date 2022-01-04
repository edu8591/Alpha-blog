require 'test_helper'
class CategoryTest < ActiveSupport::TestCase
	def setup
		@category = Category.new(name: 'Sports')
	end

	test 'Category should be valid' do
		@category = Category.new(name: 'Sports')
		assert @category.valid?
	end

	test 'Name should be present' do
		@category.name = ' '
		assert_not(
			@category.valid?,
			'The category name should not be empty or be an empty string',
		)
	end

	test 'Name should be unique' do
		@category.save
		@category2 = Category.new(name: 'Sports')
		assert_not(@category2.valid?, 'Name of the category should be unique')
	end

	test 'Name should not be too long' do
		@category.name = 'a' * 21
		assert_not(@category.valid? 'name should not be longer than 20 characters')
	end

	test 'Name should not be too short' do
		@category.name = 'aa'
		assert_not(@category.valid? 'name should be between less than 3 characters')
	end
end
