class PostsController < ApplicationController
    before_action :set_post, only [:show, edit, :update, :destroy]


    def index
        @posts = Post.all
    end

    def show
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)

        respond_to do |format|
            if @post.save
                format.html { redirect_to @post, notice: 'POST CREATED'}
                format.json { render :show, status: :created, location: @post }
            else
                format.html { render :new }
                format.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @post.destroy
        respond_to do |format|
            format.html { redirect_to posts_url, notice: "POST DELETED"}
            format.json { head :no_content}
        end
    end
    
    private
        def set_post
            @post = Post.find(params[:id])
        end

        def post_params
            params.fetch(:post, {})
        end
    end