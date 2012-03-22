class PlayersController < ApplicationController
  def index
    render json: Player.all.as_json
  end

  def show
    render json: Player.find_by_id(params[:id]).as_json
  end
end
