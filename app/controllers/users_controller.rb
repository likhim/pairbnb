# # Inherit from source code Clearance's Users' Controller
# class UsersController < Clearance::UsersController

# 	# Want to redefine user_from_params 
# 	# Hence override default clearance's user's controller
# 	def create
# 		@user = User.new(user_from_params)
# 		if @user.save
# 			sign_in @user
# 			redirect_back_or url_after_create
# 		else
# 			render template: "users/new"
# 		end
# 	end

# 	private #to not make user_from_params a method

# 	def user_from_params
# 		params.require(:user).permit(:name, :email, :password, :gender, :phone_num, :dob)
# 	end
# end

class UsersController < ApplicationController
	#DRY:find_user params
	before_action :find_user, only: [:show, :edit, :update]
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@reservations = @user.reservations
		render template: "users/show"
	end

	def edit
	end

	def update
		if @user.update(user_params)
			flash[:success] = "Update profile successful"
			redirect_to @user #@user is user_path @user.id?
		else
			flash[:danger] = "Error in updating user"
			render :edit
		end
	end

	def find_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:name, :email, :password, :gender, :phone_num, :dob, :avatar)
	end
end
