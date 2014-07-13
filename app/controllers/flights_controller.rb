class FlightsController < ApplicationController
  def search
    url = params[:url]
    results = Flight.search(url)
    render json: results.to_json
  end

  def create
    Flight.create(
      leg1: params[:leg1],
      leg2: params[:leg2],
      airline: params[:airline].delete!("\n").squeeze!,
      price: params[:price],
      link: params[:link],
      trip_id: params[:trip_id]
    )
    render json: { msg: 'Successfully saved' }.to_json
  end

  def destroy
  end
end
