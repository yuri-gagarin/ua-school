class ApplicationController < ActionController::Base


  protect_from_forgery with: :exception
  helper ApplicationHelper


  before_action :set_locale
  before_action :set_workshops
  before_action :set_index_posts

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    puts I18n.locale
  end

  def set_workshops
    @all_workshops = Workshop.all
  end

  def set_index_posts
    @index_posts = IndexPost.all
  end

  def default_url_options
    { locale: I18n.locale }
  end

end
