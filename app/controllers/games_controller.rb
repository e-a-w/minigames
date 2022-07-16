class GamesController < ApplicationController
  before_action :set_game, only: %i[show]

  def index
    @games = Game.all.order(name: :asc)
  end

  def show; end

  def new
    @game = Game.new
  end

  private

  def set_game
    @game = Game.find(params[:id])
    @deck = @game.deck
    @cards = @game.card_collection(shuffled: false)
  end

  def game_params
    params.require(:game).permit(:name, :description, :rules)
  end
end
