class LoginController < ApplicationController

    before_action :set_user

    def login
        if @user.login(login_params)
            render(json: @user.as_json, status: :ok)
        else
            render(json: {error: "Usuario não encontrado"}, status: :unprocessable_entity) and return            
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

    def login_params
        params.permit(:password)
    end

end