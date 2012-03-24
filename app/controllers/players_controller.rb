class PlayersController < ApplicationController
  def index
    respond_to do |format|
      format.html { @players = Player.all }

      format.json do
        if params[:with_seasons]
          render :json => Player.all(:include => :seasons).as_json(:with_seasons => true, :view => :index)
        else
          render :json => Player.all.as_json(:view => :index)
        end
      end
    end
  end

  def show
    respond_to do |format|
      format.html { @player = Player.find_by_id(params[:id]) }

      format.json do
        if params[:with_seasons]
          render :json => Player.find_by_id(params[:id]).as_json(:with_seasons => true)
        else
          render :json => Player.find_by_id(params[:id]).as_json
        end
      end
    end
  end
end
