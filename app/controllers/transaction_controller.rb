class TransactionController < ApplicationController
    def create
        # Verifica se o valor fornecido é muito superior a média de transações já feitas pelo usuário

        recommendation = 'approve'

        user_id = transaction_params[:user_id]
        merchant_id = transaction_params[:user_id]

        # Recupera usuário já existente ou cria novo
        user = User.found(user_id).first
        merchant = Merchant.found(merchant_id).first

        if !user.present?
            user = User.new
            user.create_not_deny(identity: user_id)
        end

        if !merchant.present?
            merchant = Merchant.new
            merchant.create_not_deny(identity: merchant_id)
        end

        # Verifica se o usuário está com flag denied
        recommendation = 'deny' if user.is_denied? || merchant.is_denied?

        @response = {
            transaction_id: 123,
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
