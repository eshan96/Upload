class PostsController < ApplicationController
before_action :set_post, only: [:destroy]
    def new
       @post = Post.new
    end

    def index
        @posts = Post.all
    end
    
    def create 
      @post = Post.create(post_params)
      redirect_to posts_path

    end

    def destroy
        @post.destroy
        respond_to do |format|
            format.html {redirect_to posts_url, notice: 'Post was successfully deleted.'}
        end
        end

    private

    def set_post
       @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:description, :image)
    end
end
