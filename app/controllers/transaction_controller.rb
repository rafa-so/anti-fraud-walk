class TransactionController < ApplicationController
    def create
        status = :ok

        user_id = transaction_params[:user_id]
        merchant_id = transaction_params[:merchant_id]

        user = User.find_or_create_by(id: user_id)
        merchant = Merchant.find_or_create_by(id: merchant_id)

        transaction = Transaction.new(
            transaction_id: transaction_params[:transaction_id],
            card_number: transaction_params[:card_number],
            transaction_amount: transaction_params[:transaction_amount],
            transaction_date: Time.parse(transaction_params[:transaction_date]),
            processed: false,
            device_id: transaction_params[:device_id],
            user_id: user.id,
            merchant_id: merchant.id
        )

        transaction_processed = ProcessRules.new(transaction).perform
        transaction_processed.save!

        response = {
            transaction_id: transaction.transaction_id,
            recommendation: transaction.approval_label
        }

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
