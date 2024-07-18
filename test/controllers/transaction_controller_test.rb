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

  test "Controller should return bad_request status code" do
    post '/transaction', params: {
      user_id: 97034,
      merchant_id: 49744,
      card_number: "404514******9116",
      transaction_date: "2019-11-24T20:16:32.812632",
      transaction_amount: 37054,
      device_id: 2854
    }, as: :json

    assert_response :bad_request
  end

  # test "Controller should return error response" do
  #   post '/transaction', params: {
  #     user_id: 97034,
  #     merchant_id: 49744,
  #     card_number: "404514******9116",
  #     transaction_date: "2019-11-24T20:16:32.812632",
  #     transaction_amount: 37054,
  #     device_id: 2854
  #   }, as: :json

  #   body = JSON.parse(@response.body)

  #   assert body["error"].present?, true
  # end

  ######## VALIDATE RULES ########

  ## REPEATED TRANSACTION RULE ##
  test "Should return bad_request status code with repeated request payload" do
    payload = {
      transaction_id: 12345,
      user_id: 97034,
      merchant_id: 49744,
      card_number: "404514******9116",
      transaction_date: "2019-11-24T20:16:32.812632",
      transaction_amount: 37054,
      device_id: 2854
    }

    post '/transaction', params: payload, as: :json

    post '/transaction', params: payload, as: :json

    assert_response :bad_request
  end

  test "Should return deny recommendation with repeated payload" do
    payload = {
      transaction_id: 12345,
      user_id: 97034,
      merchant_id: 49744,
      card_number: "404514******9116",
      transaction_date: "2019-11-24T20:16:32.812632",
      transaction_amount: 37054,
      device_id: 2854
    }

    post '/transaction', params: payload, as: :json

    post '/transaction', params: payload, as: :json

    body = JSON.parse(@response.body)

    assert body["recommendation"], 'deny'
  end

  test "Should be only one transaction data" do
    payload = {
      transaction_id: 12345,
      user_id: 97034,
      merchant_id: 49744,
      card_number: "404514******9116",
      transaction_date: "2019-11-24T20:16:32.812632",
      transaction_amount: 37054,
      device_id: 2854
    }

    post '/transaction', params: payload, as: :json

    post '/transaction', params: payload, as: :json

    assert Transaction.where(external_id: 12345).count, 1
  end

  ## MAX USER TRANSACTION TO MINUTES RULE ##
  test "Should be return bad_request status code" do
    payloads = [
      {
        transaction_id: 12344,
        user_id: 97034,
        merchant_id: 49741,
        card_number: "404554******9116",
        transaction_date: "2019-11-23T21:16:32.812632",
        transaction_amount: 30,
        device_id: 2854
      },
      {
        transaction_id: 12345,
        user_id: 97034,
        merchant_id: 49742,
        card_number: "404554******9116",
        transaction_date: "2019-11-23T21:16:32.812632",
        transaction_amount: 50,
        device_id: 2854
      },
      {
        transaction_id: 12345,
        user_id: 97034,
        merchant_id: 49744,
        card_number: "404554******9116",
        transaction_date: "2019-11-23T21:16:32.812632",
        transaction_amount: 40,
        device_id: 2854
      }
    ]

    payloads.each do |p|
      post '/transaction', params: p, as: :json
    end

    assert_response :bad_request
  end

  test "Should be return deny recommendation" do
    payloads = [
      {
        transaction_id: 12344,
        user_id: 97034,
        merchant_id: 49741,
        card_number: "404554******9116",
        transaction_date: "2019-11-23T21:16:32.812632",
        transaction_amount: 30,
        device_id: 2854
      },
      {
        transaction_id: 12345,
        user_id: 97034,
        merchant_id: 49742,
        card_number: "404554******9116",
        transaction_date: "2019-11-23T21:16:32.812632",
        transaction_amount: 50,
        device_id: 2854
      },
      {
        transaction_id: 12345,
        user_id: 97034,
        merchant_id: 49744,
        card_number: "404554******9116",
        transaction_date: "2019-11-23T21:16:32.812632",
        transaction_amount: 40,
        device_id: 2854
      }
    ]

    payloads.each do |p|
      post '/transaction', params: p, as: :json
    end

    body = JSON.parse(@response.body)

    assert body["recommendation"], 'deny'
  end

  ## CHARGEBACK RULE ##

  test "Should return bad_request user chargeback transaction before" do
    Transaction.create(
      external_id: 12345,
      user_id: 97034,
      merchant_id: 49744,
      card_number: "404554******9116",
      external_date: "2019-11-23T21:16:32.812632",
      amount: 40,
      device_id: 2854,
      approved: true,
      chargebacked: true
    )

    payload = {
      transaction_id: 12345,
      user_id: 97034,
      merchant_id: 49744,
      card_number: "404554******9116",
      transaction_date: "2019-11-23T21:16:32.812632",
      transaction_amount: 40,
      device_id: 2854
    }

    post '/transaction', params: payload, as: :json

    assert_response :bad_request
  end

  test "Should return deny recommendation user chargeback transaction before" do
    Transaction.create(
      external_id: 12345,
      user_id: 97034,
      merchant_id: 49744,
      card_number: "404554******9116",
      external_date: "2019-11-23T21:16:32.812632",
      amount: 40,
      device_id: 2854,
      approved: true,
      chargebacked: true
    )

    payload = {
      transaction_id: 12345,
      user_id: 97034,
      merchant_id: 49744,
      card_number: "404554******9116",
      transaction_date: "2019-11-23T21:16:32.812632",
      transaction_amount: 40,
      device_id: 2854
    }

    post '/transaction', params: payload, as: :json

    body = JSON.parse(@response.body)

    assert body["recommendation"], 'deny'
  end
end
