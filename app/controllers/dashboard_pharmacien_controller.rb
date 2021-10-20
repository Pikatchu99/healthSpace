class DashboardPharmacienController < ApplicationController
    before_action :authenticate_user!
    def index
        redirect_to pharmacies_path if !User.exists?(params[:id].to_i)
        if current_user.user_role == "Patient"
            redirect_to pharmacies_path, alert: "❌ You are not authorized to show page ❌"
        else
            if User.exists?(params[:id].to_i)
                @pharmacien = User.find(params[:id])
                if (@pharmacien.user_role == "Patient") || (current_user.id != @pharmacien.id)
                    redirect_to pharmacien_path(current_user.id), alert: "❌ You are not authorized to show page. Then don't do that.❌"
                end
            end
        end
    end
end
