class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
	end

	def new
		@user = User.new
	end

	def edit
		set_user
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to login_path
		else
			redirect_to new_user_path
		end
	end

	def update
		# authenticate
		password = params[:user][:password]
		new_password = params[:user][:new_password]
		confirm_password = params[:user][:confirm_password]
		if set_user.authenticated?(password)
			# user wants to update profile
			if new_password == ''
				if set_user.update(user_params)
					redirect_to posts_path
				else
					redirect_to edit_user_path
				end
			# user wants to change password
			elsif new_password == confirm_password && new_password != password && new_password != ''
				params[:user][:password] = new_password
				if set_user.update(user_params)
					redirect_to posts_path
				else
					redirect_to edit_user_path
				end
			else
				flash[:error] = 'Passwords do not match'
				# let user know the new passwords were not the same
				redirect_to edit_user_path
			end
		else
			flash[:error] = 'Invalid Password'
			# wrong password
			redirect_to edit_user_path
		end
	end

	def destroy
		session[:user_id] = nil
		set_user.destroy
		redirect_to posts_path
	end

private
	def set_user
		@user = User.find(params[:id])
	end
	def user_params
		params.require(:user).permit(
			:username, 
			:password, 
			:email, 
			:first_name, 
			:last_name, 
			:blog_name, 
			:avatar, 
			:avatar_url)
	end
end
