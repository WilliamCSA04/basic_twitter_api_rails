class UsersController < ApplicationController

    before_action :set_user, except: [:get, :create]

    def index
        render(json: @user.as_json, status: :ok)       
    end

    def get
        users = User.all.as_json
        render(json: users.as_json, status: :ok)
    end

    def create
        user = User.new(user_params)
        if user.save
            render(json: user.as_json, status: :ok)
        else
            render(json: {error: "Erro ao criar usuário"}, status: :ok)            
        end
    end

    def update
        if @user.update(user_params)
            render(json: @user.as_json, status: :ok)            
        else
            render(json: {error: "Erro ao atualizar usuário"}, status: :ok)            
        end
    end

    def delete
        if @user.destroy
            render(json: @user.as_json, status: :ok)                    
        else
            render(json: {error: "Erro ao deletar usuário"}, status: :ok)            
        end
    end

    private

    def set_user
        user = User.find_by_id(params[:user_id])
        if user.nil?
            render(json: {error: "Usuario não encontrado"}, status: :unprocessable_entity) and return
        else
            @user = user
        end
    end

    def user_params
        params.permit(:email, :name, :password)
    end

end
