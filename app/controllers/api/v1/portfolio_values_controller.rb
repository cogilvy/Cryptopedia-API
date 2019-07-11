class Api::V1::PortfolioValuesController < ApplicationController
  skip_before_action :authorized, only: [:create, :index, :show, :update]

  def index
    @portfolio_values = PortfolioValue.all
    render json: @portfolio_values
  end

  def show
    @portfolio_value = PortfolioValue.find(params[:id])
    render json: @portfolio_value
  end

  def new
    @portfolio_value = PortfolioValue.new()
  end

  def create
    @portfolio_value = PortfolioValue.create(portfolio_value_params)
    if @portfolio_value.valid?
      render json: @portfolio_value
    else
      render json: {errors: "Invalid portfolio_value creation"}
    end
  end

  def edit
    @portfolio_value = PortfolioValue.find(params[:id])
  end

  def update
    @portfolio_value = PortfolioValue.find(params[:id])
    if @portfolio_value.update(portfolio_value_params)
      render json: @portfolio_value
    else
      render json: {errors: "Invalid portfolio_value edit"}
    end
  end

  def destroy
    PortfolioValue.destroy(params[:id])
    render json: {message: "Successfully deleted portfolio_value."}
  end

  private
  def portfolio_value_params
    params.require(:portfolio_value).permit(:portfolio_id, :value, :date)
  end

end
