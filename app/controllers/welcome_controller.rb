class WelcomeController < ApplicationController
  def index
    @workshops = Workshop.all
    @recent_news = Topic.order(created_at: :desc).limit(3);
  end

  def about
  end
end
