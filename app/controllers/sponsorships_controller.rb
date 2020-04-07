class SponsorshipsController < ApplicationController
  def index
    @sponsorships = Sponsorship.where(user_id: current_user)
  end

  def new
    @sponsorship = Sponsorship.new(sponsorship_params)
    if @sponsorship.save
    request = Request.find(@sponsorship.request_id)
    request.update(status: 'accepted')
    end
    redirect_to requests_path
  end

  def destroy
    @sponsorship = Sponsorship.find(params[:id])
    request = Request.find(@sponsorship.request_id)
    request.update(status: 'pending')
    @sponsorship.delete
    redirect_to sponsorships_path
  end

  private
    # Capture the passed params
    def sponsorship_params
      params.permit(:request_id, :user_id)
    end
end
