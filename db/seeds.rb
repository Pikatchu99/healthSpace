# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cities = ["Cotonou", "Abomey-Calavi", "Porto-Novo", "Parakou", "Djougou", "Bohicon", "Natitingou", "Savè", "Abomey", "Nikki", "Lokossa", "Ouidah", "Dogbo-Tota", "Kandi", "Covè", "Malanville", "Pobé", "Kérou", "Savalou", "Sakété", "Comè", "Bembéréké", "Bassila", "Banikoara", "Kétou"," Dassa-Zoumè", "Tchaourou", "Allada", "Aplahoué", "Tanguiéta", "N'Dali", "Segbana", "Athiémé", "Grand Popo", "Kouandé"]
numbers = ["96560024","99121535","51251964","97120661","60492328","95800332","96662290","97387978","94436876","91565999","65028306","97402875","97947697","65353808","99466497"]
weeks = ["8h à 23h", "8h à 22h", "8h à 21h", "8hh à 20h", "9h à 22h", "Close", "Close", "9h à 21h30", "9h à 5h", "10h à 5h", "4h à 16h", "8h à 18h", "8h à 10h"]
images = ["https://ui-sam.unimedias.fr/build/vendor/unieditions/common/src/Ue/CoreBundle/Resources/public/img/doctype/drug.ad7f8253.jpg","https://www.aquaportail.com/pictures1801/medicaments.jpg","https://cdn.futura-sciences.com/buildsv6/images/largeoriginal/0/5/c/05c0574213_50157528_medicaments-liste-noire-revue-prescrire.jpg","https://www.aquaportail.com/pictures1801/medicaments.jpg","https://i-sam.unimedias.fr/2021/08/16/medicaments.jpg?auto=format%2Ccompress&crop=faces&cs=tinysrgb&fit=crop&h=675&w=1200","https://resize1.prod.docfr.doc-media.fr/rcrop/480,280,center-middle/img/var/doctissimo/storage/images/fr/www/medicaments/medicament-generique/661828-13-fre-FR/medicament-generique.jpg","https://www.afd.fr/sites/afd/files/styles/visuel_principal/public/2019-10-09-27-46/flickr-marco-verch.jpg?itok=XH4x7-Y4","https://static7.depositphotos.com/1000260/761/i/600/depositphotos_7611419-stock-photo-blister-pack-of-pills-remedy.jpg","https://resize2.prod.docfr.doc-media.fr/rcrop/480,280,center-middle/img/var/doctissimo/storage/images/fr/www/sante/drogues/medicaments-psychoactifs/232534-4-fre-FR/medicaments-psychoactifs.jpg","https://image.shutterstock.com/image-photo/white-capsules-closeup-near-there-260nw-1810279453.jpg","https://ui-sam.unimedias.fr/build/vendor/unieditions/common/src/Ue/CoreBundle/Resources/public/img/doctype/drug.ad7f8253.jpg","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6ePbqt_iFTAEzTsV1nEbrsIcR7fQOLripTg&usqp=CAU","https://www.weblex.fr/images/flux_actus/medicaments3.jpg","https://www.pharma-gdd.com/media/cache/resolve/product_show/upsa-fervex-adultes-8-sachets-face.jpg","https://cdn.futura-sciences.com/buildsv6/images/largeoriginal/5/b/7/5b7177f7e0_50162877_xofluza-genentech-twitter.jpg","https://img.huffingtonpost.com/asset/5c934ff52300004b00ae78fc.jpeg?ops=1778_1000","https://resize1.prod.docfr.doc-media.fr/rcrop/1200,902,center-middle/img/var/doctissimo/storage/images/fr/www/sante/grippe/grippe-aviaire-tamiflu-antiviraux/270978-2-fre-FR/grippe-aviaire-tamiflu-antiviraux.jpg","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRA4_90parHCSdJzYf6iCZYWPkPTWdaSuMhjw&usqp=CAU","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRtHP5oSVmzs-CF7WOFiCR16gVzQ2Yb1T7aA&usqp=CAU","https://previews.123rf.com/images/thissatan/thissatan1507/thissatan150700187/42554531-tablettes-pilules-tas-couleur-m%C3%A9dicaments-de-th%C3%A9rapie-m%C3%A9lange-grippe-m%C3%A9decin-m%C3%A9decine-pharmacie-anti.jpg"]

cities.each do |ci|
    10.times do
        user = User.create!(
            name: Faker::Name.unique.name,
            email: Faker::Internet.unique.email,
            city: ci,
            quartier: Faker::Address.street_name,
            user_role: "Pharmacien",
            password: "......",
            password_confirmation: "......"
        )
        pharmacy = Pharmacy.create!(
            user_id: user.id,
            name: "Pharmacy le " + Faker::Company.buzzword,
            contact: numbers.sample,
            whatsapp: numbers.sample,
            city: ci,
            quartier: Faker::Address.street_name
        )
        schedule = Schedule.create!(
            pharmacy_id: pharmacy.id,
            lundi: weeks.sample,
            mardi: weeks.sample,
            mercredi: weeks.sample,
            jeudi: weeks.sample,
            vendredi: weeks.sample,
            samedi: weeks.sample,
            dimanche: weeks.sample
        )
        patient = User.create!(
            name: Faker::Name.unique.name,
            email: Faker::Internet.unique.email,
            city: ci,
            quartier: Faker::Address.street_name,
            user_role: "Patient",
            password: "......",
            password_confirmation: "......"
        )
        favorites = Favorite.create!(
            user_id: patient.id,
            pharmacy_id: pharmacy.id,
        )
        comment = Comments.create!(
            pharmacy_id: pharmacy.id,
            user_id: patient.id,
            content: Faker::Lorem.sentences,
        )
        10.times do
            product = Product.create!(
                pharmacy_id: pharmacy.id,
                name: Faker::Movies::HarryPotter.character,
                description: Faker::Lorem.sentences,
                available: Faker::Boolean.boolean,
                first_image_temp: images.sample,
                second_image_temp: images.sample
            )
        end
    end
end
User.create!(
    name: "AGBANGLA Modeste",
    email: "modeste@gmail.com",
    city: "Cotonou",
    quartier: "Sainte Rita",
    user_role: "Admin",
    password: "......",
    password_confirmation: "......"
)