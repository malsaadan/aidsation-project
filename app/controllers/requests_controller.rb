class RequestsController < ApplicationController

  # Call the find_request method before the below actions: show, edit, update and destroy
  before_action :find_request, only: [:show, :edit, :update, :destroy]

  # Display all requests
  def index
    if current_user.type == 'Provider'
      @requests = Request.all
    else
      @requests = Request.where(user_id: current_user)
      render 'recipient_requests'
    end
  end

  # Display a single request by finding it by the passed id
  def show
    if current_user.type == 'Recipient'
      if @request.user != current_user
        error_msg
        redirect_to requests_path
      end
    end
  end

  # Create a new request
  def new
    if current_user.type == 'Recipient'
    @request = Request.new
    else
      error_msg
      redirect_to requests_path
    end
  end

  # Save the request & redirect the user to all requests
  def create 
    @request = Request.new(request_params)
    @request.user_id = current_user.id

    if @request.save
      redirect_to @request
    else
      render 'new'
    end

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

    def error_msg
      flash[:error] = 'Your account type does not support this action!'
    end
end
