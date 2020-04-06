class RequestsController < ApplicationController

  # Call the find_request method before the below actions: show, edit, update and destroy
  before_action :find_request, only: [:show, :edit, :update, :destroy]

  # Display all requests
  def index
    # if current_user.user_type == 'provider'
      @requests = Request.all
    # end
  end

  # Display a single request by finding it by the passed id
  def show

  end

  # Create a new request
  def new
    @request = Request.new
  end

  # Save the request & redirect the user to all requests
  def create 
    Request.create(request_params)
    redirect_to requests_path
  end

  # Edit the posted request by finding it by the passed id
  def edit

  end

  # Save the changed info & redirect the user to the updated request
  def update
    @request.update(request_params)
    redirect_to @request
  end

  # Delete the request
  def destroy
    @request.delete
    redirect_to requests_path
  end
  
  private
    # Capture the passed params
    def request_params
      params.require(:request).permit(:title, :description, :req_type)
    end

    # Find a request by the passed id
    def find_request 
      @request = Request.find(params[:id])
    end
end
