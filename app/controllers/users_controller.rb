class UsersController < ApplicationController
    before_action :authenticate_user!
    def show
        if params[:id].to_i != current_user.id
            redirect_to profile_path(current_user.id), alert: " ❌ Accès refusée ❌ "
        else
            @user = User.find(params[:id])
            @favorite = current_user.favorites.all
        end
    end
end
