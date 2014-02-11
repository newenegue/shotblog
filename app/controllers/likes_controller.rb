class LikesController < ApplicationController
	def index
		@likes = Like.all
	end

	def create
		@post = Post.find(params[:post_id])
		@like = @post.likes.new(user: current_user)
		@like.save
		redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:id])
		@like = Like.find_by(user_id: current_user.id, post_id: @post.id)
		@like.destroy
		redirect_to post_path(@post)
	end
end
