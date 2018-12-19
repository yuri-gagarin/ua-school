class WelcomeController < ApplicationController
  def index
    @workshops = Workshop.all
    @news_topics = Topic.reorder("created_at DESC").page(params[:page]).per_page(3)

    respond_to do |format|
      format.html 
      format.json { render json: @recent_news }
      format.js
    end
  end

  def about
  end
end
