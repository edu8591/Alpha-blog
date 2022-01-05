class CategoriesController < ApplicationController
	before_action :set_category, only: %i[show edit update]
	before_action :require_admin, except: %i[index show]
	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:notice] = 'Category was successfully created'
			redirect_to category_path(@category)
		else
			render 'new'
		end
	end

	def show
		@articles = @category.articles.paginate(page: params[:page], per_page: 5)
	end

	def index
		@categories = Category.paginate(page: params[:page], per_page: 5)
	end

	def edit; end

	def update
		if @category.update(category_params)
			flash[:notice] = 'category updated successfully'
			redirect_to category_path(@category)
		else
			render :edit
		end
	end

	private

	def set_category
		@category = Category.find(params[:id])
	end
	def category_params
		params.require(:category).permit(:name)
	end

	def require_admin
		if !(logged_in? && current_user.admin?)
			flash[:alert] = 'Only admins can perform that action'
			redirect_to categories_path
		end
	end
end
