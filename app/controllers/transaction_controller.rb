class TransactionController < ApplicationController
    def create
        @transaction = Transaction.new(
            external_id: transaction_params[:transaction_id],
            card_number: transaction_params[:card_number],
            amount: transaction_params[:transaction_amount],
            external_date: Time.parse(transaction_params[:transaction_date]),
            device_id: transaction_params[:device_id],
            user_id: transaction_params[:user_id],
            merchant_id: transaction_params[:merchant_id]
        )

        @response = {
            transaction_id: @transaction.external_id,
            recommendation: @transaction.approval_label
        }

        user_attempts = TransactionHistory
            .from_user(@transaction.user_id)
            .betwenn_range
            .count
        throw Transaction::RuleError.new if user_attempts > 3

        @transaction.save!

        render json: @response, status: :ok
    rescue Transaction::RuleError
        render json: @response, status: :bad_request
    rescue ActiveRecord::RecordInvalid
        render json: @response, status: :bad_request
    ensure
        TransactionHistory.register @transaction
    end


    def chargeback; end

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
