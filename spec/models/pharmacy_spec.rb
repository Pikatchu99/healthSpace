require 'rails_helper'


RSpec.describe Pharmacy, type: :model do
  describe 'Pharmacy Creation' do
    context "Creation avec donné invalide" do
      it "Creation échoué lorsqu'on ne renseigne pas le nom" do
        @pharmacy = Pharmacy.new(
            contact: "96560024",
            whatsapp: "96560024",
            city: "Cotonou",
            quartier: "Sainte Rita"
        )
        expect(@pharmacy).not_to be_valid
      end
      it "Creation échoué lorsqu'on ne renseigne pas le contact" do
        @pharmacy = Pharmacy.new(
            name: "Pharmacy le monde",
            whatsapp: "96560024",
            city: "Cotonou",
            quartier: "Sainte Rita"
        )
        expect(@pharmacy).not_to be_valid
      end
      it "Creation échoué lorsqu'on ne renseigne pas le whatsapp" do
        @pharmacy = Pharmacy.new(
            name: "Pharmacy le monde",
            contact: "96560024",
            city: "Cotonou",
            quartier: "Sainte Rita"
        )
        expect(@pharmacy).not_to be_valid
      end
      it "Creation échoué lorsqu'on ne renseigne pas la ville" do
        @pharmacy = Pharmacy.new(
            name: "Pharmacy le monde",
            contact: "96560024",
            whatsapp: "96560024",
            quartier: "Sainte Rita"
        )
        expect(@pharmacy).not_to be_valid
      end
      it "Creation échoué lorsqu'on ne renseigne pas le quartier" do
        @pharmacy = Pharmacy.new(
            name: "Pharmacy le monde",
            contact: "96560024",
            city: "Cotonou",
            whatsapp: "96560024",
        )
        expect(@pharmacy).not_to be_valid
      end
      context "Creation avec donnés valide" do
        it "Creation valide lorsqu'on renseigne tout les champs" do
            @pharmacy = Pharmacy.new(
                name: "Pharmacy le monde",
                contact: "96560024",
                whatsapp: "96560024",
                city: "Cotonou",
                quartier: "Sainte Rita"
            )
          expect(@pharmacy).to be_valid
        end
      end
    end
  end
end