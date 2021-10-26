require 'rails_helper'

#Inscription d'un Utilisateur Pharmacien disposant d'une pharmacie et consultation et modifications

describe 'creation de pharmacie' do
    context "Create Pharmacie" do
      it "Creation réussi" do
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
        expect(page).to have_text "Pharmacy le Lycée"
        expect(page).to have_link 'Editer la Pharmacie'
      end
    end
  end
  describe 'creation de pharmacie' do
    context "Create Pharmacie" do
      it "Creation échoué" do
        visit new_user_session_path
        second_user = FactoryBot.create(:second_user)
        fill_in 'user[email]', with: 'username2@example.com'
        fill_in 'user[password]', with: 'password'
        click_button "Se Connecter"
        expect(page).to have_text "Connecté."
        fill_in 'pharmacy[name]', with: 'Pharmacy le Lycée'
        fill_in 'pharmacy[contact]', with: '+225 96560024'
        fill_in 'pharmacy[whatsapp]', with: '+225 96560024'
        select "Cotonou", from: 'pharmacy[city]'
        fill_in 'pharmacy[quartier]', with: 'Sainte Rita'
        click_button "Enregistrer ma pharmacie"
        expect(page).to have_text "Contact n'est pas valide"
        expect(page).to have_text "Whatsapp n'est pas valide"
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
        expect(page).to have_text 'Connecté.'
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
        expect(page).to have_text "username2"
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
  