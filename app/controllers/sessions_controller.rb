class SessionsController < ApplicationController
    before_action :logged_in?, only: [:new, :create]

    def new

    end

    def create
        @current_user = User.find_by(email: params[:email], password: params[:password])
        if @current_user
            session[:user_id] = @current_user.id
            flash[:notice] = "ログインに成功しました。"
            redirect_to memos_path
        else
            flash[:alert] = "ログインに失敗しました。"
            render action: "new"
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to new_sessions_path
    end

end

