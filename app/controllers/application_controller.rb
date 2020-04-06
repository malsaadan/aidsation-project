class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    # forces an authentication before every action in all controllers
    before_action :authenticate_user!
end
