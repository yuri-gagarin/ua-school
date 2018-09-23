class WelcomeController < ApplicationController
  def index
    puts ENV['TEST_VALUE']
  end

  def about
  end
end
