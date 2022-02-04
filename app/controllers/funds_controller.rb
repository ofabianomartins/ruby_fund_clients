class FundsController < ApplicationController
  before_action :set_fund, only: %i[ show update destroy ]

  # GET /funds
  def index
    @funds = Fund.all

    render json: @funds
  end

  # GET /funds/1
  def show
    render json: @fund
  end

  # POST /funds
  def create
    @fund = Fund.new(fund_params)

    if @fund.save
      render json: @fund, status: :created, location: @fund
    else
      render json: @fund.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /funds/1
  def update
    if @fund.update(fund_params)
      render json: @fund
    else
      render json: @fund.errors, status: :unprocessable_entity
    end
  end

  # DELETE /funds/1
  def destroy
    @fund.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fund
      @fund = Fund.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fund_params
      params.require(:fund).permit(:name, :creation_date)
    end
end
