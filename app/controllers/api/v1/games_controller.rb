class Api::V1::GamesController < ApplicationController
  skip_before_action :authorized, only: [:create, :index, :show]

  def index
    @games = Game.all.order(:id)
    render json: @games
  end

  def show
    @game = Game.find(params[:id])
    render json: @game
  end

  def new
    @game = Game.new()
  end

  def create
    @game = Game.create(game_params)
    if @game.valid?
      render json: @game
    else
      render json: {errors: "Invalid game creation"}
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      render json: @game
    else
      render json: {errors: "Invalid game edit"}
    end
  end

  private
  def game_params
    params.require(:game).permit(:title, :budget, :start, :end)
  end
end
