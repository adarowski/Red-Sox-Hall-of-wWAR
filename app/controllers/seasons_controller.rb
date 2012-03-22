class SeasonsController < ApplicationController
  def index
    if params[:player_id].present?
      render json: Player.find_by_id(params[:player_id]).seasons.order('year asc').as_json
    else
      render json: Season.order('year asc, id asc').as_json
    end
  end

  def show
    render json: Season.find_by_id(params[:id]).as_json
  end
end
