class Api::V1::FavoritesController < ApplicationController

  def index
    @favorites = Favorite.all
    render json: @favorites
  end

  def show
    @favorite = Favorite.find(params[:id])
    render json: @favorite
  end

  def new
    @favorite = Favorite.new()
  end

  def create
    @favorite = Crime.create(favorite_params)
    if @favorite.valid?
      render json: @favorite
    else
      render json: {errors: "Invalid favorite creation"}
    end
  end

  private
  def favorite_params
    params.require(:favorite).permit(:crypto_id, :user_id)
  end

end
