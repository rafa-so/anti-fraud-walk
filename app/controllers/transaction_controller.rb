class TransactionController < ApplicationController
    def create
        # Verifica se o valor fornecido é muito superior a média de transações já feitas pelo usuário

        recommendation = 'approve'

        user_id = transaction_params[:user_id]
        merchant_id = transaction_params[:merchant_id]

        # Recupera usuário já existente ou cria novo
        user = User.find_or_create_by(id: user_id)
        merchant = Merchant.find_or_create_by(id: merchant_id)

        # # Verifica se o usuário está com flag denied
        recommendation = 'deny' if user.is_denied? || merchant.is_denied?

        @response = {
            transaction_id: transaction_params[:transaction_id],
            recommendation: recommendation
        }

        render json: @response, status: :ok
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
