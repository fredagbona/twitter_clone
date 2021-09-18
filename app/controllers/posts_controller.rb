class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    def index
        @post = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if params[:back]
          render :new
        else
          if @post.save
            redirect_to posts_path, notice: "post Enregistré !"
          else 
            render :new 
          end
        end
    end

    def show

    end

    def update
        @post.update(post_params)
        if @post.update(post_params)
          redirect_to posts_path, notice: "post modifié !"
        else 
          render :edit  
        end
    end

    def destroy
        @post.destroy
        redirect_to posts_path, notice: "post supprimé"
    end

    def confirm 
        @post = Post.new(post_params)
        render :new if @post.invalid?
        
    end

    private
  def post_params 
    params.require(:post).permit(:name, :content)
  end
  
  def set_post 
    @post = Post.find(params[:id])
  end
end
