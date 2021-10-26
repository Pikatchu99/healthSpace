require 'rails_helper'

RSpec.describe Pharmacy, type: :model do
    describe 'Pharmacy Creation' do
      context "Creation avec donné invalide" do
        it "Creation échoué lorsqu'on ne renseigne pas le lundi" do
            @schedule = Schedule.new(
                mardi: "8h à 00h",
                mercredi: "8h à 00h",
                jeudi: "8h à 00h",
                vendredi: "8h à 00h",
                samedi: "8h à 00h",
                dimanche: "8h à 00h"
            )
            expect(@schedule).not_to be_valid 
        end
        it "Creation échoué lorsqu'on ne renseigne pas le mardi" do
            @schedule = Schedule.new(
                lundi: "8h à 00h",
                mercredi: "8h à 00h",
                jeudi: "8h à 00h",
                vendredi: "8h à 00h",
                samedi: "8h à 00h",
                dimanche: "8h à 00h"
            )
            expect(@schedule).not_to be_valid 
        end
        it "Creation échoué lorsqu'on ne renseigne pas le mercredi" do
            @schedule = Schedule.new(
                lundi: "8h à 00h",
                mardi: "8h à 00h",
                jeudi: "8h à 00h",
                vendredi: "8h à 00h",
                samedi: "8h à 00h",
                dimanche: "8h à 00h"
            )
            expect(@schedule).not_to be_valid 
        end
        it "Creation échoué lorsqu'on ne renseigne pas la jeudi" do
            @schedule = Schedule.new(
                lundi: "8h à 00h",
                mardi: "8h à 00h",
                mercredi: "8h à 00h",
                vendredi: "8h à 00h",
                samedi: "8h à 00h",
                dimanche: "8h à 00h"
            )
            expect(@schedule).not_to be_valid 
        end
        it "Creation échoué lorsqu'on ne renseigne pas le vendredi" do
            @schedule = Schedule.new(
                lundi: "8h à 00h",
                mardi: "8h à 00h",
                mercredi: "8h à 00h",
                jeudi: "8h à 00h",
                samedi: "8h à 00h",
                dimanche: "8h à 00h"
            )
            expect(@schedule).not_to be_valid 
        end
        it "Creation échoué lorsqu'on ne renseigne pas le samedi" do
            @schedule = Schedule.new(
                lundi: "8h à 00h",
                mardi: "8h à 00h",
                mercredi: "8h à 00h",
                jeudi: "8h à 00h",
                vendredi: "8h à 00h",
                dimanche: "8h à 00h"
            )
            expect(@schedule).not_to be_valid 
        end
        it "Creation échoué lorsqu'on ne renseigne pas le dimanche" do
            @schedule = Schedule.new(
                lundi: "8h à 00h",
                mardi: "8h à 00h",
                mercredi: "8h à 00h",
                jeudi: "8h à 00h",
                vendredi: "8h à 00h",
                samedi: "8h à 00h"
            )
            expect(@schedule).not_to be_valid 
        end
        context "Creation avec donnés valide" do
          it "Creation valide lorsqu'on renseigne tout les champs" do
            @schedule = Schedule.new(
                lundi: "8h à 00h",
                mardi: "8h à 00h",
                mercredi: "8h à 00h",
                jeudi: "8h à 00h",
                vendredi: "8h à 00h",
                samedi: "8h à 00h",
                dimanche: "8h à 00h"
            )
            expect(@schedule).to be_valid
          end
        end
      end
    end
end