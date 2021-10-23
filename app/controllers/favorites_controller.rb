class FavoritesController < ApplicationController
   before_action :authenticate_user!
    def create
      if current_user.user_role == "Pharmacien" && current_user.pharmacy.id == params[:pharmacy_id].to_i
         redirect_to pharmacy_path(params[:pharmacy_id]), notice: "Vous ne pouvez pas ajouter votre pharmacie en favorites."
      else 
         favorite = current_user.favorites.create(pharmacy_id: params[:pharmacy_id])
         redirect_to pharmacy_path(params[:pharmacy_id]), notice: "La pharmacy #{favorite.pharmacy.name} a été ajouté aux favoris"
      end
   end
   def destroy
     favorite = current_user.favorites.find_by(id: params[:id]).destroy
     if params[:where] == "2"
        redirect_to profile_path(current_user.id), notice: "La pharmacy #{favorite.pharmacy.name} a été supprimé des favoris"
     else 
      redirect_to pharmacy_path(params[:pharmacy_id]), notice: "La pharmacy #{favorite.pharmacy.name} a été supprimé des favoris"
     end
   end
  end
  