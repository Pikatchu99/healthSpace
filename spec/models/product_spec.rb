require 'rails_helper'

images = ["https://ui-sam.unimedias.fr/build/vendor/unieditions/common/src/Ue/CoreBundle/Resources/public/img/doctype/drug.ad7f8253.jpg","https://www.aquaportail.com/pictures1801/medicaments.jpg","https://cdn.futura-sciences.com/buildsv6/images/largeoriginal/0/5/c/05c0574213_50157528_medicaments-liste-noire-revue-prescrire.jpg","https://www.aquaportail.com/pictures1801/medicaments.jpg","https://i-sam.unimedias.fr/2021/08/16/medicaments.jpg?auto=format%2Ccompress&crop=faces&cs=tinysrgb&fit=crop&h=675&w=1200","https://resize1.prod.docfr.doc-media.fr/rcrop/480,280,center-middle/img/var/doctissimo/storage/images/fr/www/medicaments/medicament-generique/661828-13-fre-FR/medicament-generique.jpg","https://www.afd.fr/sites/afd/files/styles/visuel_principal/public/2019-10-09-27-46/flickr-marco-verch.jpg?itok=XH4x7-Y4","https://static7.depositphotos.com/1000260/761/i/600/depositphotos_7611419-stock-photo-blister-pack-of-pills-remedy.jpg","https://resize2.prod.docfr.doc-media.fr/rcrop/480,280,center-middle/img/var/doctissimo/storage/images/fr/www/sante/drogues/medicaments-psychoactifs/232534-4-fre-FR/medicaments-psychoactifs.jpg","https://image.shutterstock.com/image-photo/white-capsules-closeup-near-there-260nw-1810279453.jpg","https://ui-sam.unimedias.fr/build/vendor/unieditions/common/src/Ue/CoreBundle/Resources/public/img/doctype/drug.ad7f8253.jpg","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6ePbqt_iFTAEzTsV1nEbrsIcR7fQOLripTg&usqp=CAU","https://www.weblex.fr/images/flux_actus/medicaments3.jpg","https://www.pharma-gdd.com/media/cache/resolve/product_show/upsa-fervex-adultes-8-sachets-face.jpg","https://cdn.futura-sciences.com/buildsv6/images/largeoriginal/5/b/7/5b7177f7e0_50162877_xofluza-genentech-twitter.jpg","https://img.huffingtonpost.com/asset/5c934ff52300004b00ae78fc.jpeg?ops=1778_1000","https://resize1.prod.docfr.doc-media.fr/rcrop/1200,902,center-middle/img/var/doctissimo/storage/images/fr/www/sante/grippe/grippe-aviaire-tamiflu-antiviraux/270978-2-fre-FR/grippe-aviaire-tamiflu-antiviraux.jpg","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRA4_90parHCSdJzYf6iCZYWPkPTWdaSuMhjw&usqp=CAU","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRtHP5oSVmzs-CF7WOFiCR16gVzQ2Yb1T7aA&usqp=CAU","https://previews.123rf.com/images/thissatan/thissatan1507/thissatan150700187/42554531-tablettes-pilules-tas-couleur-m%C3%A9dicaments-de-th%C3%A9rapie-m%C3%A9lange-grippe-m%C3%A9decin-m%C3%A9decine-pharmacie-anti.jpg"]

RSpec.describe Product, type: :model do
    describe 'Produit Creation' do
        context "Creation avec donné invalide" do
            it "Creation échoué lorsqu'on ne renseigne pas le nom" do
                @product = Product.new(
            description: "Je m'appelle paractamol et je gueris les mot de tete depuis ma naissance. Depuis que je suis née mon papa ma dis que je suis trzs fort.",
            available: true,
            first_image: "https://ui-sam.unimedias.fr/build/vendor/unieditions/common/src/Ue/CoreBundle/Resources/public/img/doctype/drug.ad7f8253.jpg",
            second_image: "https://ui-sam.unimedias.fr/build/vendor/unieditions/common/src/Ue/CoreBundle/Resources/public/img/doctype/drug.ad7f8253.jpg"
        )
        expect(@product).not_to be_valid
    end
    it "Creation échoué lorsqu'on ne renseigne pas le description" do
        @product = Product.new(
            name: "Paracetamol",
            available: true,
            first_image: "https://ui-sam.unimedias.fr/build/vendor/unieditions/common/src/Ue/CoreBundle/Resources/public/img/doctype/drug.ad7f8253.jpg",
            second_image: "https://ui-sam.unimedias.fr/build/vendor/unieditions/common/src/Ue/CoreBundle/Resources/public/img/doctype/drug.ad7f8253.jpg"
        )
        expect(@product).not_to be_valid
    end

    context "Creation avec donnés valide" do
        it "Creation valide lorsqu'on renseigne tout les champs" do
            @product = Product.new(
                name: "Paracetamol",
                description: "Je m'appelle paractamol et je gueris les mot de tete depuis ma naissance. Depuis que je suis née mon papa ma dis que je suis trzs fort.",
                available: true,
            )
            expect(@product).to be_valid
        end
        it "Creation échoué lorsqu'on ne renseigne pas la disponibilité" do
          @product = Product.new(
              name: "Paracetamol",
              description: "Je m'appelle paractamol et je gueris les mot de tete depuis ma naissance. Depuis que je suis née mon papa ma dis que je suis trzs fort.",
          )
          expect(@product).to be_valid
        end
      end
    end
  end
end