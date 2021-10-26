require 'rails_helper'


RSpec.describe User, type: :model do
  describe 'User Creation' do
    context "Creation avec donné invalide" do
      it "Creation échoué lorsqu'on ne renseigne pas le nom" do
        @user = User.new(
          email: "guestadmin@gmail.com",
          city: "Cotonou",
          quartier: "Sainte Rita",
          user_role: "Patient",
          password: "......",
          password_confirmation: "......"
        )
        expect(@user).not_to be_valid
      end
      it "Creation échoué lorsqu'on ne renseigne pas le email" do
        @user = User.new(
          name: "Invité Admin",
          city: "Cotonou",
          quartier: "Sainte Rita",
          user_role: "Patient",
          password: "......",
          password_confirmation: "......"
        )
        expect(@user).not_to be_valid
      end
      it "Creation échoué lorsqu'on ne renseigne pas le ville" do
        @user = User.new(
          name: "Invité Admin",
          email: "guestadmin@gmail.com",
          quartier: "Sainte Rita",
          user_role: "Patient",
          password: "......",
          password_confirmation: "......"
        )
        expect(@user).not_to be_valid
      end
      it "Creation échoué lorsqu'on ne renseigne pas le quartier" do
        @user = User.new(
          name: "Invité Admin",
          email: "guestadmin@gmail.com",
          city: "Cotonou",
          user_role: "Patient",
          password: "......",
          password_confirmation: "......"
        )
        expect(@user).not_to be_valid
      end
      context "Creation avec donnés valide" do
        it "Creation valide lorsqu'on renseigne tout les champs" do
          @user = User.new(
            name: "Invité Admin",
            email: "guestadmin@gmail.com",
            city: "Cotonou",
            quartier: "Sainte Rita",
            user_role: "Patient",
            password: "......",
            password_confirmation: "......"
          )
          expect(@user).to be_valid
        end
        it "Creation valide lorsqu'on ne renseigne pas le role" do
          @user = User.new(
            name: "Invité Admin",
            email: "guestadmin@gmail.com",
            city: "Cotonou",
            quartier: "Sainte Rita",
            password: "......",
            password_confirmation: "......"
          )
          expect(@user).to be_valid
        end
      end
    end
  end
end