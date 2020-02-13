class WelcomeController < ApplicationController
  def username
      return params[:first_name]
  end
end
