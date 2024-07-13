class WelcomeController < ApplicationController
    def index
        render json: { message: "bem vindo ao anti fraude" }, status: :ok
    end
end