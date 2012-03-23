class PlayersController < ApplicationController
  def index
    if params[:with_seasons]
      render json: Player.all(include: :seasons).as_json(with_seasons: true)
    else
      render json: Player.all.as_json
    end
  end

  def show
    if params[:with_seasons]
      render json: Player.find_by_id(params[:id]).as_json(with_seasons: true)
    else
      render json: Player.find_by_id(params[:id]).as_json
    end
  end
end
