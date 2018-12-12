class AboutController < ApplicationController
  def home
    @topics = Topic.all.order(created_at: :asc)
   
  end

  def news
    @topics = Topic.all.order(created_at: :desc)
    @recent_topics = Topic.order(created_at: :desc).limit(3);
    puts @recent_topics
  end

  def organization
  end

  def history
  end
end
