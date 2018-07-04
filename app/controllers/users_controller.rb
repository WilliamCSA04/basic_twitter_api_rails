class UsersController < ApplicationController

    def index
        user = User.find_by_id(params[:user_id])
        if user.nil?
            render(json: {error: "Usuario não encontrado"}, status: :unprocessable_entity)
        else
            render(json: user.as_json, status: :ok)
        end    
    end

    def get
        users = User.all.as_json
        render(json: users.as_json, status: :ok)
    end

    def create
        user = User.new(create_params)
        if user.save
            render(json: users.as_json, status: :ok)
        else
            render(json: {error: "Erro ao salvar usuário"}, status: :ok)            
        end
    end

end
