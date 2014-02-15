class PostsController < ApplicationController

	before_action :login_required, except: [:new,:create]
	
	def index
		if !current_user
			params[:show] = 'all'
			# @user = User.new
		end
		if params[:show] == 'all'
			@posts = Post.all
			# @user = current_user
		else
			# show only current users posts
			@posts = current_user.posts
			# @user = current_user
		end

		# show param access in html
		@show = params[:show]
	end

	def show
		set_post
		@show_comments = params[:show_comments]
		if params[:show_comments] == 'all' || @post.comments.length <= 3
			@comments = @post.comments
		else
			@comments = @post.comments[-3..-1]
		end
	end

	def new
		@post = Post.new
	end

	def edit
		set_post
	end

	def create
		# Create post through current user
		@user = current_user
		@post = @user.posts.new(post_params)
		if @post.save
			@post.shot_ids = pending_shot_ids
			reset_shot_ids
			# redirect_to @post
			redirect_to posts_path
		else
			flash[:error] = 'Post title is missing'
			render action: 'new'
		end
	end

	def update
		if set_post.user == current_user && set_post.update(post_params)
			redirect_to post_path
		else
			redirect_to edit_post_path
		end
	end

	def destroy
		set_post.destroy
		redirect_to posts_path
	end

private
	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :body)
	end

end
