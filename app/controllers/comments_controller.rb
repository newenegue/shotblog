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
		if @comment.update_attributes(:commenter => current_user.username, :timestamp => Time.now)
			redirect_to post_path(@post)
		else
			render action: 'new'
		end
	end

private
	def set_comment
		@comment = Comment.find(params[:id])
	end

	def comment_params
		params.require(:comment).permit(:body, :post_id, :commenter, :timestamp)
	end
end
