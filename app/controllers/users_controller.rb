class UsersController < ApplicationController

    def index
        users = User.find_by_id(params[:user_id])
        if users.nil?
            render(json: {error: "Usuario não encontrado"}, status: :unprocessable_entity)
        else
            render(json: users.as_json, status: :ok)
        end    
    end

end
