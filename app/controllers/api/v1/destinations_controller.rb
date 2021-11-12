class Api::V1::DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
  end

  def show
    @destination = Destination.find(params[:id])
  end

  def create
    Destination.create!(dest_params)
    render json: { status: 'Success!', message: 'Destination created successively' }
  rescue ActiveRecord::RecordInvalid => e
    render json: { status: 'Error!', message: e.record.errors }
  end

  # def destroy
  #   @destination = Destination.find(params[:id])
  #   @destination.destroy
  # end

  def dest_params
    params.permit(:name, :location, :image_url, :price_per_day)
  end
end
