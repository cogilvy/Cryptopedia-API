class Api::V1::PortfoliosController < ApplicationController
  skip_before_action :authorized, only: [:create, :index, :show, :update]

  def index
    @portfolios = Portfolio.all
    render json: @portfolios
  end

  def show
    @portfolio = Portfolio.find(params[:id])
    render json: @portfolio
  end

  def new
    @portfolio = Portfolio.new()
  end

  def create
    @portfolio = Portfolio.create(portfolio_params)
    if @portfolio.valid?
      render json: @portfolio
    else
      render json: {errors: "Invalid portfolio creation"}
    end
  end

  def edit
    @portfolio = Portfolio.find(params[:id])
  end

  def update
    @portfolio = Portfolio.find(params[:id])
    if @portfolio.update(portfolio_params)
      render json: @portfolio
    else
      render json: {errors: "Invalid portfolio edit"}
    end
  end

  def destroy
    Portfolio.destroy(params[:id])
    render json: {message: "Successfully deleted portfolio."}
  end

  private
  def portfolio_params
    params.require(:portfolio).permit(:name, :budget, :game_id, :user_id)
  end

end
