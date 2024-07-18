require "test_helper"

class TransactionControllerTest < ActionDispatch::IntegrationTest
  test "Controller should status code ok" do
    post '/transaction', params: {
      transaction_id: 123456,
      user_id: 97034,
      merchant_id: 49744,
      card_number: "404514******9116",
      transaction_date: "2019-11-24T20:16:32.812632",
      transaction_amount: 37054,
      device_id: 2854
    }, as: :json

    assert_response :ok
  end

  test "Controller should response with transaction_id" do
    post '/transaction', params: {
      transaction_id: 123456,
      user_id: 97034,
      merchant_id: 49744,
      card_number: "404514******9116",
      transaction_date: "2019-11-24T20:16:32.812632",
      transaction_amount: 37054,
      device_id: 2854
    }, as: :json

    body = JSON.parse(@response.body)

    assert body["transaction_id"].present?, true
  end

  test "Controller should response with recommendation" do
    post '/transaction', params: {
      transaction_id: 123456,
      user_id: 97034,
      merchant_id: 49744,
      card_number: "404514******9116",
      transaction_date: "2019-11-24T20:16:32.812632",
      transaction_amount: 37054,
      device_id: 2854
    }, as: :json

    body = JSON.parse(@response.body)

    assert body["recommendation"].present?, true
  end

  test "Controller should response with transaction id equal from params" do
    post '/transaction', params: {
      transaction_id: 123456,
      user_id: 97034,
      merchant_id: 49744,
      card_number: "404514******9116",
      transaction_date: "2019-11-24T20:16:32.812632",
      transaction_amount: 37054,
      device_id: 2854
    }, as: :json

    body = JSON.parse(@response.body)

    assert body["transaction_id"], 123456
  end

  test "Controller should response with approved recommendation" do
    post '/transaction', params: {
      transaction_id: 123456,
      user_id: 97034,
      merchant_id: 49744,
      card_number: "404514******9116",
      transaction_date: "2019-11-24T20:16:32.812632",
      transaction_amount: 37054,
      device_id: 2854
    }, as: :json

    body = JSON.parse(@response.body)

    assert body["recommendation"], 'approved'
  end
end
