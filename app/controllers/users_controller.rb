class UsersController < ApplicationController

    def index
        user = User.find_by_id(params[:user_id])
        if user.nil?
            render(json: {error: "Usuario não encontrado"}, status: :unprocessable_entity)
        else
            render(json: user.as_json, status: :ok)
        end    
    end


end
