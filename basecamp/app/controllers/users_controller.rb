class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
    end

    def index
        @users = User.all
    end

    def setAdmin

    end

    def removeAdmin

    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy

        if @user.destroy
            redirect_to root_url, notice: "User deleted."
        end
    end
end
