# Inherit from source code Clearance's Users' Controller
class UsersController < Clearance::UsersController

	# Want to redefine user_from_params 
	# Hence override default clearance's user's controller
	def create
		@user = User.new(user_from_params)
		if @user.save
			sign_in @user
			redirect_back_or url_after_create
		else
			render template: "users/new"
		end
	end

	private #to not make user_from_params a method

	def user_from_params
		params.require(:user).permit(:name, :email, :password, :gender, :phone_num, :dob)
	end

end