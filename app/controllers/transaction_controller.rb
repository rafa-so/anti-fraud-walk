class TransactionController < ApplicationController
    def create
        @response = {
            transaction_id: 123,
            recommendation: "approve"
        }

        render json: @response, status: :ok
    end
end
