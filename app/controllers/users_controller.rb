class UsersController < ApplicationController
    before_action :authenticate_user!
    def show
        puts params[:id]
        puts current_user.id
        if params[:id].to_i != current_user.id
            redirect_to profile_path(current_user.id), alert: " ❌ You are not supposed to show this page ❌ "
        else
            @user = User.find(params[:id])
            @favorite = current_user.favorites.all
        end
    end
end
