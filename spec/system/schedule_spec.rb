require 'rails_helper'


#Horaires d'ouverture
describe 'Pharmacien peux creer un produit', type: :system do
    context "Mise a jour de l'horaire" do
      it "Mise a jour du planing réussi" do
        second_user = FactoryBot.create(:second_user)
        second_pharmacy = FactoryBot.create(:second_pharmacy)
        second_schedule = FactoryBot.create(:second_schedule)
        visit new_user_session_path
        fill_in 'user[email]', with: 'username2@example.com'
        fill_in 'user[password]', with: 'password'
        click_button "Se Connecter"
        click_on "Profile"
        click_on "Manager ma Pharmacie"
        click_on "Editer les horaires"
        fill_in "schedule[lundi]", with: "Close"
        click_on "Enregistrer les horaires."
        expect(page).to have_text "Horaires d'ouvertures mise à jour avec succès."
      end
    end
  end