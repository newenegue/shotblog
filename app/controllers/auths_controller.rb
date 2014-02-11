class AuthsController < ApplicationController
	
	# show login form
	def new
		if current_user
			redirect_to users_path
		else
			@user = User.new
		end
	end

	# log in
	def create
		# @tmp_user = User.new(username: params[:user][:username])
		user = User.find_by(username: params[:user][:username])

		if user && user.authenticated?(params[:user][:password])
			session[:user_id] = user.id
			redirect_to posts_path
		else
			flash[:error] = 'Invalid Username/Password'
			# render action: 'new'
			redirect_to login_path
		end
	end

	#log out
	def destroy
		session[:user_id] = nil
		redirect_to posts_path
	end
end