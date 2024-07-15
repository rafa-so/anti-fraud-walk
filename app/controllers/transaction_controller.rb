class TransactionController < ApplicationController
    def create
        response = {
            transaction_id: transaction_params[:transaction_id],
            recommendation: 'approve'
        }

        status = :ok

        user_id = transaction_params[:user_id]
        merchant_id = transaction_params[:merchant_id]

        user = User.find_or_create_by(id: user_id)
        merchant = Merchant.find_or_create_by(id: merchant_id)

        transaction = Transaction.find_or_create_by(id: transaction_params[:transaction_id]) do |t|
          t.card_number = transaction_params[:card_number]
          t.transaction_date = transaction_params[:transaction_date]
          t.transaction_amount = transaction_params[:transaction_amount]
          t.device_id = transaction_params[:device_id]
        end

        response[:transaction_id] = transaction.id

        if UnitDenied.new.execute(user, merchant)
            response[:recommendation] = 'deny'
            status = :bad_request
        end

        render json: response, status: status
    end

    private
    def transaction_params
        params.permit(
            :transaction_id,
            :user_id,
            :merchant_id,
            :card_number,
            :transaction_date,
            :transaction_amount,
            :device_id
        )
    end
end
