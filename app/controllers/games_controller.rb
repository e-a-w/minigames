class GamesController < ApplicationController
  before_action :set_game, only: %i[show]

  # GET /games or /games.json
  def index
    @games = Game.all
  end

  # GET /games/1 or /games/1.json
  def show; end

  # GET /games/new
  def new
    @game = Game.new
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
    @deck = @game.deck
    @cards = @game.card_collection.shuffle
  end

  # Only allow a list of trusted parameters through.
  def game_params
    params.require(:game).permit(:name, :description, :rules)
  end
end
