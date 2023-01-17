class UsersController < ApplicationController
    before_action :current_user, only: [:show, :edit, :update]
    before_action :logged_in?, only: [:new, :create]

    def new
        @user_new = User.new
    end

    def show
        @user = User.find(session[:user_id])
    end

    def edit
        @user = User.find(session[:user_id])
    end

    def create
        @user_new = User.new(user_params)
        if @user_new.save
            session[:user_id] = @user_new.id
            flash.now[:notice] = "ユーザーの新規登録に成功しました。"
            redirect_to memos_path
        else
            flash.now[:alert] = "ユーザーの新規登録に失敗しました。"
            render action: "new"
        end
    end

    def update
        @user = User.find(session[:user_id])
        if @user.update(user_params)
            redirect_to users_path
            flash.now[:notice] = "ユーザー情報の更新に成功しました。"
        else
            render action: "edit"
            flash.now[:alert] = "ユーザー情報の更新に失敗しました。"
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

end
