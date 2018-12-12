class TopicsController < ApplicationController
  include AuthorizationsHelper
  before_action :authorize_admin


  def new
    @topic = Topic.new

  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id

    if @topic.save
      redirect_to action: :news, controller: :about, notice: "Topic was saved succesfully."
    else
      flash.now[:alert] = "Error creating a topic. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    @topic_image = TopicImage.new
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.user_id = current_user.id
    @topic.assign_attributes(topic_params)

    if @topic.save
      flash[:notice] = "Topic was updated."
      redirect_to action: :news, controller: :about
    else
      flash.now[:alert] = "Error saving topic. Please try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      flash[:notice] = "\"#{@topic.name}\" was deleted succesfully."
      redirect_to action: :index, controller: :admin
    else
      flash.now[:alert] = "There was an error deleting the topic."
      render :show
    end
  end


  private

    def topic_params
      params.require(:topic).permit(:name, :user_id, :category, :description)
    end
end
