class CommentsController < ApplicationController
	def index
		@comments = Comment.all
	end

	def new
		@comment = Comment.new
	end

	def show
		
	end

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			# redirect_to post_path(@post)
			redirect_to posts_path
			# render partial: 'posts/show_post', locals: {post: @post}
		else
			render action: 'new'
		end
	end

private
	def set_comment
		@comment = Comment.find(params[:id])
	end

	def comment_params
		params.require(:comment).permit(:body, :post_id, :timestamp)
	end
end
