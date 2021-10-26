require 'rails_helper'


describe 'User inscription' do
context "Inscription avec des donnée valide" do
    it "Inscription réussi" do
      visit new_user_registration_path
      fill_in 'user[name]', with: 'username'
      fill_in 'user[email]', with: 'username@example.com'
      select "Cotonou", from: "user[city]"
      fill_in 'user[quartier]', with: 'Sainte Rita'
      select "Patient", from: 'user[user_role]'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      click_button "S'inscrire"
      expect(page).to have_text 'Bienvenue, vous êtes connecté.'
      expect(page).to have_link 'Deconnexion'
    end
  end
end

describe 'with invalid data' do
  context "Inscription avec des données invalide" do
    it "Inscription échoué" do
      visit new_user_registration_path
      click_button "S'inscrire"
      expect(page).to have_text "E-mail doit être rempli(e)"
      expect(page).to have_text "Password doit être rempli(e)"
      expect(page).to have_text "Quartier doit être rempli(e)"
      expect(page).to have_text "Ville doit être rempli(e)"
      expect(page).to have_no_link 'Deconnexion'
    end
  end
end
describe 'User connexion' do
  context "Connexion avec donné valide" do
    it "Connexion réussi" do
      user = FactoryBot.create(:user)
      visit new_user_session_path
      fill_in 'user[email]', with: 'username@example.com'
      fill_in 'user[password]', with: 'password'
      click_button "Se Connecter"
      expect(page).to have_text 'Connecté.'
      expect(page).to have_link 'Deconnexion'
    end
  end
end


describe 'User connexion' do
  context "Connexion avec donné invalide" do
    it "Connexion échoué" do
      user = FactoryBot.create(:user)
      visit new_user_session_path
      fill_in 'user[email]', with: 'username@example.com'
      click_button "Se Connecter"
      expect(page).to have_text 'Email et/ou mot de passe incorrect(s).'
    end
  end
end

# fonction de deconnexion d'un user
describe 'User deconnexion', type: :system do
  context "Deconnexion" do
    it "Deconnexion réussi" do
      visit new_user_session_path
      user = FactoryBot.create(:user)
      fill_in 'user[email]', with: 'username@example.com'
      fill_in 'user[password]', with: 'password'
      click_button "Se Connecter"
      expect(page).to have_text 'Connecté.'
      click_on "Deconnexion"
      expect(page).to have_text 'Déconnecté.'
    end
  end
end



describe 'Consulter son profile' do
  context "Profile Pharmacien" do
    it "Profile Pharmacien consulter réussi" do
      visit new_user_session_path
      second_user = FactoryBot.create(:second_user)
      fill_in 'user[email]', with: 'username2@example.com'
      fill_in 'user[password]', with: 'password'
      click_button "Se Connecter"
      expect(page).to have_text "Connecté."
      fill_in 'pharmacy[name]', with: 'Pharmacy le Lycée'
      fill_in 'pharmacy[contact]', with: '96560024'
      fill_in 'pharmacy[whatsapp]', with: '96560024'
      select "Cotonou", from: 'pharmacy[city]'
      fill_in 'pharmacy[quartier]', with: 'Sainte Rita'
      click_button "Enregistrer ma pharmacie"
      expect(page).to have_text "Pharmacie crée avec succès. Maintenant ajoutez vos horaires d'ouvertures."
      fill_in 'schedule[lundi]', with: '8h à 00h'
      fill_in 'schedule[mardi]', with: '8h à 00h'
      fill_in 'schedule[mercredi]', with: "8h à 00h"
      fill_in 'schedule[jeudi]', with: "8h à 00h"
      fill_in 'schedule[vendredi]', with: "8h à 00h"
      fill_in 'schedule[samedi]', with: "8h à 00h"
      fill_in 'schedule[dimanche]', with: "8h à 00h"
      click_button "Enregistrer les horaires."
      expect(page).to have_text "Horaires d'ouvertures crée avec succès. Voici votre Dashboard."
      click_on "Profile"
      expect(page).to have_link 'Editer mon Profil'
      expect(page).to have_text "Vous n'avez aucun favoris."
      expect(page).to have_text "username2@example.com"
      expect(page).to have_text "Je dispose d'une pharmacie"
    end
  end
end
describe 'Consulter son profile' do
  context "Profile " do
    it "Profile Patient consulter réussi" do
      visit new_user_session_path
      user = FactoryBot.create(:user)
      fill_in 'user[email]', with: 'username@example.com'
      fill_in 'user[password]', with: 'password'
      click_button "Se Connecter"
      expect(page).to have_text 'Connecté.'
      click_on "Profile"
      expect(page).to have_link 'Editer mon Profil'
      expect(page).to have_text "Vous n'avez aucun favoris."
      expect(page).to have_text "username@example.com"
      expect(page).to have_text "Je recherche des services."
    end
  end
end
describe 'Modifier son profile' do
  context "Profile" do
    it "Profile modifier avec succès" do
      visit new_user_session_path
      user = FactoryBot.create(:user)
      fill_in 'user[email]', with: 'username@example.com'
      fill_in 'user[password]', with: 'password'
      click_button "Se Connecter"
      expect(page).to have_text 'Connecté.'
      click_on "Profile"
      click_on "Editer mon Profil"
      fill_in "user[name]", with: "username222"
      fill_in "user[current_password]", with: "password"
      click_on "Mettre a jour"
      expect(page).to have_text "Votre compte a été modifié avec succès."
    end
  end
end


#Un utilisateur simple ne peux pas acceder a l'ecran d'administration
describe "Administration", type: :system do
    context "Accès refusé a l'ecran d'administration" do
      it "Accès refusé pour un utilisateur" do
        second_user = FactoryBot.create(:second_user)
        second_pharmacy = FactoryBot.create(:second_pharmacy)
        second_schedule = FactoryBot.create(:second_schedule)
        visit new_user_session_path
        fill_in 'user[email]', with: 'username2@example.com'
        fill_in 'user[password]', with: 'password'
        click_button "Se Connecter"
        visit "/admin"
        expect(page).to have_text "Accès reservée uniquement aux administrateurs."
      end
    end
  end

  #Un admin peux acceder a l'ecran d'administration
describe "Administration", type: :system do
    context "Accès autorisé a l'ecran d'administration" do
      it "Accès autorisé pour un administrateur " do
        f_user = FactoryBot.create(:f_user)
        visit new_user_session_path
        fill_in 'user[email]', with: 'username4@example.com'
        fill_in 'user[password]', with: 'password'
        click_button "Se Connecter"
        visit "/admin"
        expect(page).to have_text "Administration"
      end
    end
  end