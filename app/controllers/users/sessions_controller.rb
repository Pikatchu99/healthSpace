# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
  
  def after_sign_in_path_for(resource_or_scope)
    if current_user.user_role == "Admin"
      # flash[:notice] =  "Bienvenue Admin #{current_user.name}. Voici votre écran d'administration. \n Pour acéder à votre profile Utilisateur cliquer sur le boutton Home en haut à droite."
      rails_admin.dashboard_url
    elsif current_user.user_role == "Pharmacien" && current_user.pharmacy.nil?
      # flash[:notice] = "Bon retour parmis nous.En tant que pharmacien vous devez crée votre pharmacie."
      new_pharmacy_path
    else
      # flash[:notice] = "Bon retour parmis nous #{current_user.name}."
     pharmacies_path
    end
  end
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
