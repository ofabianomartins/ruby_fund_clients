require "test_helper"

class InvestmentRedemptionTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @investment_redemption_transaction = investment_redemption_transactions(:one)
  end

  test "should get index" do
    get investment_redemption_transactions_url, as: :json
    assert_response :success
  end

  test "should create investment_redemption_transaction" do
    assert_difference("InvestmentRedemptionTransaction.count") do
      post investment_redemption_transactions_url, params: { investment_redemption_transaction: { client_id: @investment_redemption_transaction.client_id, date: @investment_redemption_transaction.date, fund_id: @investment_redemption_transaction.fund_id, value: @investment_redemption_transaction.value } }, as: :json
    end

    assert_response :created
  end

  test "should show investment_redemption_transaction" do
    get investment_redemption_transaction_url(@investment_redemption_transaction), as: :json
    assert_response :success
  end

  test "should update investment_redemption_transaction" do
    patch investment_redemption_transaction_url(@investment_redemption_transaction), params: { investment_redemption_transaction: { client_id: @investment_redemption_transaction.client_id, date: @investment_redemption_transaction.date, fund_id: @investment_redemption_transaction.fund_id, value: @investment_redemption_transaction.value } }, as: :json
    assert_response :success
  end

  test "should destroy investment_redemption_transaction" do
    assert_difference("InvestmentRedemptionTransaction.count", -1) do
      delete investment_redemption_transaction_url(@investment_redemption_transaction), as: :json
    end

    assert_response :no_content
  end
end
