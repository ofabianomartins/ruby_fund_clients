class InvestmentRedemptionTransactionsController < ApplicationController
  before_action :set_investment_redemption_transaction, only: %i[show update destroy]

  # GET /investment_redemption_transactions
  def index
    @investment_redemption_transactions = InvestmentRedemptionTransaction.all

    render json: @investment_redemption_transactions
  end

  # GET /investment_redemption_transactions/1
  def show
    render json: @investment_redemption_transaction
  end

  # POST /investment_redemption_transactions
  def create
    @investment_redemption_transaction = InvestmentRedemptionTransaction.new(investment_redemption_transaction_params)

    if @investment_redemption_transaction.save
      render json: @investment_redemption_transaction, status: :created, location: @investment_redemption_transaction
    else
      render json: @investment_redemption_transaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /investment_redemption_transactions/1
  def update
    if @investment_redemption_transaction.update(investment_redemption_transaction_params)
      render json: @investment_redemption_transaction
    else
      render json: @investment_redemption_transaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /investment_redemption_transactions/1
  def destroy
    @investment_redemption_transaction.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_investment_redemption_transaction
    @investment_redemption_transaction = InvestmentRedemptionTransaction.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def investment_redemption_transaction_params
    param.require(:investment_redemption_transaction).permit(:date, :value, :client_id, :fund_id)
  end
end
