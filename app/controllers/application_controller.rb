class ApplicationController < ActionController::Base

    def current_user
        if session[:user_id]
          @current_user = User.find(session[:user_id])
        else
          flash[:alert] = "ログインする必要があります。"
          redirect_to new_sessions_path
        end
    end

    def logged_in?
        if session[:user_id]
            @current_user = User.find(session[:user_id])
            flash[:notice] = "すでにログインしています。"
            redirect_to memos_path
        end
    end

end
