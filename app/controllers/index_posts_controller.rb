class IndexPostsController < ApplicationController
  include AuthorizationsHelper
  before_action :authorize_admin
  # GET /index_posts
  def index
    @index_posts = IndexPost.all
  end

  # GET /index_posts/1
  def show
  end

  # GET /index_posts/new
  def new
    @index_post = IndexPost.new
  end

  # GET /index_posts/1/edit
  def edit
  end

  # POST /index_posts
  def create
    @index_post = IndexPost.new(index_post_params)
    puts params
  end

  # PATCH/PUT /index_posts/1
  def update
    if @index_post.update(index_post_params)
      redirect_to @index_post, notice: 'Index post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /index_posts/1
  def destroy
    @index_post.destroy
    redirect_to index_posts_url, notice: 'Index post was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_index_post
      @index_post = IndexPost.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def index_post_params
      params.require(:index_post).permit(:title, :description, :type)
    end
end
