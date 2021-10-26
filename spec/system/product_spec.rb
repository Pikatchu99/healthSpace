require 'rails_helper'

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