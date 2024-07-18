class TransactionController < ApplicationController
    def create
        @transaction = Transaction.find_or_initialize_by(external_id: transaction_params[:transaction_id]) do |t|
            t.card_number = transaction_params[:card_number],
            t.amount = transaction_params[:transaction_amount],
            t.external_date = Time.parse(transaction_params[:transaction_date]),
            t.device_id = transaction_params[:device_id],
            t.user_id = transaction_params[:user_id],
            t.merchant_id = transaction_params[:merchant_id]
        end

        if !@transaction.valid?
            return render json: {
                error: @transaction.errors.full_messages.join(". ")
            }, status: :bad_request
        end

        @transaction = ProcessRules.new(@transaction).perform

        @response = {
            transaction_id: @transaction.external_id,
            recommendation: @transaction.approval_label
        }

        if !@transaction.id && @transaction.save
            render json: @response, status: :ok
        else
            render json: @response, status: :bad_request
        end
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
