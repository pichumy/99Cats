class CatsRentalRequestsController < ApplicationController
  def new
    @request = CatsRentalRequest.new
    render :new
  end
end
