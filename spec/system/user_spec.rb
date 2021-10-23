require 'rails_helper'

# Utilisateur ne disposant d'une pharmacie Patient 
describe 'User Patient signs up', type: :system do
  describe 'User inscription' do
    context "SIgn up with valid data" do
      it "Sign Up success" do
        visit new_user_registration_path
        fill_in 'user[name]', with: 'username'
        fill_in 'user[email]', with: 'username@example.com'
        select "Cotonou", from: "user[city]"
        fill_in 'user[quartier]', with: 'Sainte Rita'
        select "Patient", from: 'user[user_role]'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button "S'inscrire"
        expect(page).to have_text 'Bienvenue! Inscription réussi avec succès.'
        expect(page).to have_link 'Deconnexion'
      end
    end
  end
  describe 'with invalid data' do
    context "SIgn up with invalid data" do
      it "Sign Up failed" do
        visit new_user_registration_path
        click_button "S'inscrire"

        expect(page).to have_text "Email can't be blank"
        expect(page).to have_text "Password can't be blank"
        expect(page).to have_text "Quartier doit être définie.!"
        expect(page).to have_text "City doit être définie.!"
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
        expect(page).to have_text 'Bon retour parmis nous'
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
        expect(page).to have_text 'Email ou mot de passe invalide.'
      end
    end
  end
end


#Inscription d'un Utilisateur Pharmacien disposant d'une pharmacie et consultation et modifications

describe 'User Pharmacien signs up with pharmacie', type: :system do
  describe 'creation de pharmacie' do
    context "Create Pharmacie" do
      it "Creation success" do
        visit new_user_session_path
        second_user = FactoryBot.create(:second_user)
        fill_in 'user[email]', with: 'username2@example.com'
        fill_in 'user[password]', with: 'password'
        click_button "Se Connecter"
        expect(page).to have_text "Bon retour parmis nous.En tant que pharmacien vous devez crée votre pharmacie."
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
        expect(page).to have_text "Pharmacy le Lycée"
        expect(page).to have_link 'Editer la Pharmacie'
      end
    end
  end
  describe 'creation de pharmacie' do
    context "Create Pharmacie" do
      it "Creation failed" do
        visit new_user_session_path
        second_user = FactoryBot.create(:second_user)
        fill_in 'user[email]', with: 'username2@example.com'
        fill_in 'user[password]', with: 'password'
        click_button "Se Connecter"
        expect(page).to have_text "Bon retour parmis nous.En tant que pharmacien vous devez crée votre pharmacie."
        fill_in 'pharmacy[name]', with: 'Pharmacy le Lycée'
        fill_in 'pharmacy[contact]', with: '+225 96560024'
        fill_in 'pharmacy[whatsapp]', with: '+225 96560024'
        select "Cotonou", from: 'pharmacy[city]'
        fill_in 'pharmacy[quartier]', with: 'Sainte Rita'
        click_button "Enregistrer ma pharmacie"
        expect(page).to have_text "Contact is invalid"
        expect(page).to have_text "Whatsapp is invalid"
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
        expect(page).to have_text "Bon retour parmis nous.En tant que pharmacien vous devez crée votre pharmacie."
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
        expect(page).to have_text 'Bon retour parmis nous'
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
        expect(page).to have_text 'Bon retour parmis nous'
        click_on "Profile"
        click_on "Editer mon Profil"
        fill_in "user[name]", with: "username222"
        fill_in "user[current_password]", with: "password"
        click_on "Mettre a jour"
        expect(page).to have_text "Votre compte à été mis a jour avec succès."
      end
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
      expect(page).to have_text 'Bon retour parmis nous'
      click_on "Deconnexion"
      expect(page).to have_text 'Deconnexion réussi.'
    end
  end
end


#Consuter les pharmacies disponibles dans sa ville 

describe 'Pharmacie disponible', type: :system do
  before do 
    user = FactoryBot.create(:user)
    pharmacy = FactoryBot.create(:pharmacy)
    schedule = FactoryBot.create(:schedule)
    second_user = FactoryBot.create(:second_user)
    second_pharmacy = FactoryBot.create(:second_pharmacy)
    second_schedule = FactoryBot.create(:second_schedule)
    third_user = FactoryBot.create(:third_user)
    third_pharmacy = FactoryBot.create(:third_pharmacy)
    third_schedule = FactoryBot.create(:third_schedule)
    product = FactoryBot.create(:product)
    second_product = FactoryBot.create(:second_product)
    third_product = FactoryBot.create(:third_product)
  end
  context "Consulter la liste des pharmacies disponibles" do
    it "Consultation réussi" do
      visit new_user_session_path
      fill_in 'user[email]', with: 'username@example.com'
      fill_in 'user[password]', with: 'password'
      click_button "Se Connecter"
      expect(page).to have_text 'Bon retour parmis nous'
      expect(page).to have_text 'Pharmacie disponible dans votre ville.'
      expect(page).to have_text '2 Pharmacies trouvées'
      expect(page).to have_text 'Pharmacy la Grâce'
      expect(page).to have_text 'Pharmacy Tokpa'
      expect(page).not_to have_content 'Pharmacy Parakou'
    end
  end

  context "Voir l'ecran de details d'une pharmacie" do
    it "Succès pour la visualisation de l'ecran de details" do
      visit new_user_session_path
      fill_in 'user[email]', with: 'username@example.com'
      fill_in 'user[password]', with: 'password'
      click_button "Se Connecter"
      click_on "Plus", :match => :first
      expect(page).to have_text "Pharmacy Détails"
      expect(page).to have_link "Ajouter en favoris"
      expect(page).to have_text "Pharmacy la Grâce"
      expect(page).to have_text "Tous les produits de cette pharmacie"
      expect(page).to have_text "96560024"
      expect(page).to have_text "Amoxiciline"
      expect(page).to have_text "Quinine"
      expect(page).to have_text "Paracétamol"
    end
  end

  #Demander par le lien whatsapp généré si le produit est disponible
  context "Voir l'ecran de details d'une pharmacie" do
    it "Succès pour la visualisation de l'ecran de details" do
      visit new_user_session_path
      fill_in 'user[email]', with: 'username2@example.com'
      fill_in 'user[password]', with: 'password'
      click_button "Se Connecter"
      click_on "Plus", :match => :first
      expect(page).to have_text "Pharmacy Détails"
      click_on "Voir ce produit", :match => :first
      expect(page).to have_link "Demander à la pharmacie"
      click_on "Demander à la pharmacie"
      
    end
  end

  #Evaluer une pharmacie
  context "Faire un commentaire." do
    it "Succès pour la commenter une pharmacie" do
      visit new_user_session_path
      fill_in 'user[email]', with: 'username2@example.com'
      fill_in 'user[password]', with: 'password'
      click_button "Se Connecter"
      click_on "Plus", :match => :first
      expect(page).to have_text "Pharmacy Détails"
      fill_in "comment[content]", with: "Je suis très content de cette pharmacie" 
      click_on "Comment"
      expect(page).to have_text "Par username2"
      expect(page).to have_text "Je suis très content de cette pharmacie"
    end
  end

  #FAVORIS
  context "Favoris" do
    it "Ajout suppression des favoris" do
      visit new_user_session_path
      fill_in 'user[email]', with: 'username2@example.com'
      fill_in 'user[password]', with: 'password'
      click_button "Se Connecter"
      click_on "Plus", :match => :first
      expect(page).to have_text "Pharmacy Détails"
      click_on "Ajouter en favoris"
      expect(page).to have_text "La pharmacy Pharmacy la Grâce a été ajouté aux favoris"

      #Voir la liste des favoris
      click_on "Profile"
      expect(page).to have_text "Pharmacy la Grâce"
      expect(page).to have_text "96560024"

      #Supprimer un favoris
      click_on "Supprimer des favoris"
      page.driver.browser.switch_to.alert.accept
      # binding.irb
      expect(page).to have_text "La pharmacy Pharmacy la Grâce a été supprimé des favoris"
      expect(page).to have_text "Vous n'avez aucun favoris."
    end
  end


  #FONCTION DE RECHERCHE 

  #PHARMACIES
  context "Recherche" do
    it "Rechercher des pharmacies réussi" do
      visit new_user_session_path
      fill_in 'user[email]', with: 'username2@example.com'
      fill_in 'user[password]', with: 'password'
      click_button "Se Connecter"

      #By name only
      fill_in 'Nom', with: 'Pharmacy la Grâce'
      click_on "Chercher"
      expect(page).to have_text '1 Pharmacies trouvées'
      expect(page).to have_text 'Pharmacy la Grâce'
      expect(page).not_to have_content 'Pharmacy Tokpa'
      
      #By city only
      page.select 'Cotonou', from: 'pc'
      click_on "Chercher"
      expect(page).to have_text '2 Pharmacies trouvées'
      expect(page).to have_text 'Pharmacy la Grâce'
      expect(page).to have_text 'Pharmacy Tokpa'
      
      #By quartier only
      fill_in 'Quartier', with: 'Oké dama'
      click_on "Chercher"
      expect(page).to have_text '1 Pharmacies trouvées'
      expect(page).to have_text 'Pharmacy Parakou'
      expect(page).not_to have_content 'Pharmacy Tokpa'
      
      #By name with city
      fill_in 'Nom', with: 'Pharmacy la Grâce'
      page.select 'Cotonou', from: 'pc'
      click_on "Chercher"
      expect(page).to have_text '1 Pharmacies trouvées'
      expect(page).to have_text 'Pharmacy la Grâce'
      expect(page).not_to have_content 'Pharmacy Tokpa'
      
      #By name with quartier
      fill_in 'Nom', with: 'Pharmacy Tokpa'
      fill_in 'Quartier', with: 'Oké dama'
      click_on "Chercher"
      expect(page).to have_text '0 Pharmacies trouvées'
      
      #By city with quartier
      page.select 'Cotonou', from: 'pc'
      fill_in 'Quartier', with: 'Sainte Rita'
      click_on "Chercher"
      expect(page).to have_text '2 Pharmacies trouvées'
      expect(page).to have_text 'Pharmacy la Grâce'
      expect(page).to have_text 'Pharmacy Tokpa'
      
      #By name city and quartier
      fill_in 'Nom', with: 'Pharmacy Parakou'
      page.select 'Parakou', from: 'pc'
      fill_in 'Quartier', with: 'Oké dama'
      click_on "Chercher"
      expect(page).to have_text '1 Pharmacies trouvées'
      expect(page).to have_text 'Pharmacy Parakou'
      expect(page).not_to have_content 'Pharmacy Tokpa'
    end
  end

  #PRODUITS

  context "Recherche" do
    it "Rechercher des produits réussi" do
      visit new_user_session_path
      fill_in 'user[email]', with: 'username@example.com'
      fill_in 'user[password]', with: 'password'
      click_button "Se Connecter"
      click_on "Plus", :match => :first
      expect(page).to have_text "Pharmacy Détails"
      expect(page).to have_link "Ajouter en favoris"
      fill_in "Nom du produit", with: "Quinine"
      click_on "Chercher"
      expect(page).to have_text "Quinine"
      expect(page).to have_text "Disponible"
    end
  end
end

describe 'Pharmacien peux creer un produit', type: :system do
  before do
    second_user = FactoryBot.create(:second_user)
      second_pharmacy = FactoryBot.create(:second_pharmacy)
      second_schedule = FactoryBot.create(:second_schedule)
      visit new_user_session_path
      fill_in 'user[email]', with: 'username2@example.com'
      fill_in 'user[password]', with: 'password'
      click_button "Se Connecter"
      click_on "Profile"
      click_on "Manager ma Pharmacie"
  end
  # Create 
  context "Create Produit" do
    it "Creation de produit reussi" do
      click_on "Créer un nouveau produit"
      fill_in "product[name]", with: "Elle est a la mode beauty"
      fill_in "product[description]", with:"Ella est un produit natuelle fait maison qui a des vertus de sages."
      click_on "Enregistrer le produit"
      expect(page).to have_text "Produit crée avec succès."
      expect(page).to have_text "Elle est a la mode beauty"
    end
  end
  #Update
  context "Update Produit" do
    it "Mise a jour de produit reussi" do
      click_on "Créer un nouveau produit"
      fill_in "product[name]", with: "Elle est a la mode beauty"
      fill_in "product[description]", with:"Ella est un produit natuelle fait maison qui a des vertus de sages."
      click_on "Enregistrer le produit"
      click_on "Edit"
      fill_in "product[name]", with: "Elle Beauty"
      click_on "Enregistrer le produit"
      expect(page).to have_text "Produit mis à jour avec succès."
      expect(page).to have_text "Elle Beauty"
    end
  end
  #Destroy
  context "Destroy Produit" do
    it "Ecrasement de produit reussi" do
      click_on "Créer un nouveau produit"
      fill_in "product[name]", with: "Elle est a la mode beauty"
      fill_in "product[description]", with:"Ella est un produit natuelle fait maison qui a des vertus de sages."
      click_on "Enregistrer le produit"
      click_on "Destroy"
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_text "Le produit a été détruit avec succès."
      expect(page).not_to have_text "Elle Beauty"
    end
  end
end


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
      # binding.irb
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
      expect(page).to have_text "Site Administration"
    end
  end
end