class DashboardPharmacienController < ApplicationController
  before_action :authenticate_user!
  def index
    redirect_to pharmacies_path, alert: ' ❌ Accès non autorisé ❌ ' unless User.exists?(params[:id].to_i)
    if current_user.user_role == 'Patient'
      redirect_to pharmacies_path, alert: ' ❌ Accès non autorisé ❌ '
    elsif User.exists?(params[:id].to_i)
      @pharmacien = User.find(params[:id])
      @pharmacy = Pharmacy.find(@pharmacien.pharmacy.id)
      @products = @pharmacien.pharmacy.products.page(params[:page]).per(10)
      if (@pharmacien.user_role == 'Patient') || (current_user.id != @pharmacien.id)
        redirect_to pharmacien_path(current_user.id), alert: '❌ Accès non autorisé. ❌'
      end
    end
  end
end
