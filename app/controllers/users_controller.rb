class UsersController < ApplicationController

    before_action :set_user, except: [:get, :create]

    # return a user given a user_id parameter
    def index
        render(json: @user.as_json, status: :ok)       
    end

    # return all users from database
    def get
        users = User.all.as_json
        render(json: users.as_json, status: :ok)
    end

    # create user with password, email and name params
    def create
        user = User.new(user_params)
        if user.save
            render(json: user.as_json, status: :ok)
        else
            render(json: {error: "Erro ao criar usuário"}, status: :ok)            
        end
    end

    # update a user with password, email and name params
    def update
        if @user.update(user_params)
            render(json: @user.as_json, status: :ok)            
        else
            render(json: {error: "Erro ao atualizar usuário"}, status: :ok)            
        end
    end

    # delete a user from database
    def delete
        if @user.destroy
            render(json: @user.as_json, status: :ok)                    
        else
            render(json: {error: "Erro ao deletar usuário"}, status: :ok)            
        end
    end

    private

    #Search for user and return if not find
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
