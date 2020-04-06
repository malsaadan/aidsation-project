class HomeController < ApplicationController

  # Skip the index action from authentication
  # skip_before_action :authenticate_user!, :only => [:index]

  def index
  end
end
