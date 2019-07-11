class Api::V1::PurchasesController < ApplicationController
  skip_before_action :authorized, only: [:create, :index]

  def index
    @purchases = Purchase.all
    render json: @purchases
  end

  def show
    @purchase = Purchase.find(params[:id])
    render json: @purchase
  end

  def new
    @purchase = Purchase.new()
  end

  def create
    @purchase = Purchase.create(purchase_params)
    if @purchase.valid?
      render json: @purchase
    else
      render json: {errors: "Invalid purchase creation"}
    end
  end

  def edit
    @purchase = Purchase.find(params[:id])
  end

  def update
    @purchase = Purchase.find(params[:id])
    if @purchase.update(purchase_params)
      render json: @purchase
    else
      render json: {errors: "Invalid purchase edit"}
    end
  end

  def destroy
    Purchase.destroy(params[:id])
    render json: {message: "Successfully deleted purchase."}
  end

  private
  def purchase_params
    params.require(:purchase).permit(:quantity, :crypto_id, :portfolio_id)
  end

end
