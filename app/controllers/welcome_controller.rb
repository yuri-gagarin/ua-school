class WelcomeController < ApplicationController
  def index
    @workshops = Workshop.all
  end

  def about
  end
end
