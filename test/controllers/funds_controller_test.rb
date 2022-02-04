require "test_helper"

class FundsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fund = funds(:one)
  end

  test "should get index" do
    get funds_url, as: :json
    assert_response :success
  end

  test "should create fund" do
    assert_difference("Fund.count") do
      post funds_url, params: { fund: { creation_date: @fund.creation_date, name: @fund.name } }, as: :json
    end

    assert_response :created
  end

  test "should show fund" do
    get fund_url(@fund), as: :json
    assert_response :success
  end

  test "should update fund" do
    patch fund_url(@fund), params: { fund: { creation_date: @fund.creation_date, name: @fund.name } }, as: :json
    assert_response :success
  end

  test "should destroy fund" do
    assert_difference("Fund.count", -1) do
      delete fund_url(@fund), as: :json
    end

    assert_response :no_content
  end
end
