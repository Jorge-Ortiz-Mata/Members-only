class PostsController < ApplicationController

    def new 
        @post = Post.new
    end

    def create
        @post = current_user.posts.new(post_params)
        # @post = Post.new(post_params.merge(user_id: current_user.id))
        # @post.user_id = current_user.id
        if @post.save
            redirect_to root_path, notice: "Post was successfully created."
        else
            render :new, status: :unprocessable_entity
        end
    end

    private 

        def post_params
            params.require(:post).permit(:body)
        end

end
