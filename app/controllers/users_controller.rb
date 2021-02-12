class UsersController < ApplicationController
    before_action :authenticate_user!

    def show
        if params[:id].present?
            @user = User.find(params[:id])
        else
            @user = current_user
        end

        @projects = @user.projects.paginate(page: params[:page], per_page: 3)
        print @projects

        if @user != current_user && !current_user.admin?
            redirect_to user_path(current_user)
        end
    end

    def index
        if !current_user.admin?
            flash[:alert] = "You don't have access to this page"
            redirect_to user_path(current_user)
        end
        @users = User.all.paginate(page: params[:page], per_page: 5)
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy

        if current_user == @user
            user_session = nil
        end
        
        if @user.destroy
            redirect_to root_url, notice: "User deleted."
        end
    end

    def makeAdmin
        @user = User.find(params[:id])
        @user.admin = true
        @user.save
        redirect_to(users_url)
    end

    def removeAdmin
        @user = User.find(params[:id])
        @user.admin = false
        @user.save
        redirect_to(users_url)
    end
end
