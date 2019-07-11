class Api::V1::CryptosController < ApplicationController
  skip_before_action :authorized, only: [:create, :index]

  def index
    @cryptos = Crypto.all.order(:id)
    render json: @cryptos
  end

  def show
    @crypto = Crypto.find(params[:id])
    render json: @crypto
  end

  def new
    @crypto = Crypto.new()
  end

  def create
    @crypto = Crypto.create(crypto_params)
    if @crypto.valid?
      render json: @crypto
    else
      render json: {errors: "Invalid crypto creation"}
    end
  end

  def edit
    @crypto = Crypto.find(params[:id])
  end

  def update
    @crypto = Crypto.find(params[:id])
    if @crypto.update(crypto_params)
      render json: @crypto
    else
      render json: {errors: "Invalid crypto edit"}
    end
  end

  private
  def crypto_params
    params.require(:crypto).permit(:name, :symbol, :price, :logo, :market_cap, :volume, :change_1hr, :change_24hr, :change_7d)
  end

end
