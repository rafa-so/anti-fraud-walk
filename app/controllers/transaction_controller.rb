class TransactionController < ApplicationController
    def create
        # user_id = transaction_params[:user_id]
        # Verifica se o usuário é um usuário com flag de permissão
        # Verifica se o fornecedor está com a flag de permissão
        # Verifica se o valor fornecido é muito superior a média de transações já feitas pelo usuário

        recommendation = 'approve'

        user_id = transaction_params[:user_id]

        # Recupera usuário já existente ou cria novo
        user = User.found(user_id).first

        if !user.present?
            user = User.new
            user.create_not_deny(identity: user_id)
        end

        # Verifica se o usuário está com flag denied
        recommendation = 'deny' if user.is_denied?

        @response = {
            transaction_id: 123,
            recommendation: recommendation
        }

        render json: @response, status: :ok
    end

    private
    def transaction_params
      params.permit(:user_id)
    end
end
