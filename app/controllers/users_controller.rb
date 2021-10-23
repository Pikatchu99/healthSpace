class UsersController < ApplicationController
    before_action :authenticate_user!
    def show
        if current_user && current_user.user_role == "Pharmacien" && current_user.pharmacy.nil?
            flash[:alert] = "Veuillez créer votre pharmacie." 
            redirect_to new_pharmacy_path
        end
        if params[:id].to_i != current_user.id
            redirect_to profile_path(current_user.id), alert: " ❌ Accès refusée ❌ "
        else
            @user = User.find(params[:id])
            @favorite = current_user.favorites.all
        end
    end
end
