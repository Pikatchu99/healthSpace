FactoryBot.define do
    factory :product do
        id {1}
        name {"Amoxiciline"}
        description { "Lorem ipsum dolor sit amet consectetur adipisicing elit. Delectus, dolorum recusandae facilis nam sint laudantium neque saepe excepturi, quasi veritatis labore obcaecati, reprehenderit repellat est omnis totam ipsum optio itaque?" }
        available { false }
        pharmacy_id { 1 }
        first_image_temp { "https://cdn.futura-sciences.com/buildsv6/images/largeoriginal/0/5/c/05c0574213_50157528_medicaments-liste-noire-revue-prescrire.jpg" }
        second_image_temp { "https://www.aquaportail.com/pictures1801/medicaments.jpg"  }
    end
end
  
FactoryBot.define do
  factory :second_product, class: Product do
        id {2}
        name {"Quinine"}
        description { "Lorem ipsum dolor sit amet consectetur adipisicing elit. Delectus, dolorum recusandae facilis nam sint laudantium neque saepe excepturi, quasi veritatis labore obcaecati, reprehenderit repellat est omnis totam ipsum optio itaque?" }
        available { true }
        pharmacy_id { 1 }
        first_image_temp { "https://www.aquaportail.com/pictures1801/medicaments.jpg" }
        second_image_temp { "https://cdn.futura-sciences.com/buildsv6/images/largeoriginal/0/5/c/05c0574213_50157528_medicaments-liste-noire-revue-prescrire.jpg"  }
    end
end

FactoryBot.define do
    factory :third_product, class: Product do
        id {3}
        name {"Paracétamol"}
        description { "Lorem ipsum dolor sit amet consectetur adipisicing elit. Delectus, dolorum recusandae facilis nam sint laudantium neque saepe excepturi, quasi veritatis labore obcaecati, reprehenderit repellat est omnis totam ipsum optio itaque?" }
        available { true }
        pharmacy_id { 1 }
        first_image_temp { "https://www.aquaportail.com/pictures1801/medicaments.jpg" }
        second_image_temp { "https://ui-sam.unimedias.fr/build/vendor/unieditions/common/src/Ue/CoreBundle/Resources/public/img/doctype/drug.ad7f8253.jpg"  }
    end
end


FactoryBot.define do
    factory :for_product do
        id {4}
        name {"Amoxiciline"}
        description { "Lorem ipsum dolor sit amet consectetur adipisicing elit. Delectus, dolorum recusandae facilis nam sint laudantium neque saepe excepturi, quasi veritatis labore obcaecati, reprehenderit repellat est omnis totam ipsum optio itaque?" }
        available { false }
        pharmacy_id { 2 }
        first_image_temp { "https://cdn.futura-sciences.com/buildsv6/images/largeoriginal/0/5/c/05c0574213_50157528_medicaments-liste-noire-revue-prescrire.jpg" }
        second_image_temp { "https://www.aquaportail.com/pictures1801/medicaments.jpg"  }
    end
end
  
FactoryBot.define do
  factory :five_product, class: Product do
        id {5}
        name {"Quinine"}
        description { "Lorem ipsum dolor sit amet consectetur adipisicing elit. Delectus, dolorum recusandae facilis nam sint laudantium neque saepe excepturi, quasi veritatis labore obcaecati, reprehenderit repellat est omnis totam ipsum optio itaque?" }
        available { true }
        pharmacy_id { 2 }
        first_image_temp { "https://www.aquaportail.com/pictures1801/medicaments.jpg" }
        second_image_temp { "https://cdn.futura-sciences.com/buildsv6/images/largeoriginal/0/5/c/05c0574213_50157528_medicaments-liste-noire-revue-prescrire.jpg"  }
    end
end

FactoryBot.define do
    factory :six_product, class: Product do
        id {6}
        name {"Paracétamol"}
        description { "Lorem ipsum dolor sit amet consectetur adipisicing elit. Delectus, dolorum recusandae facilis nam sint laudantium neque saepe excepturi, quasi veritatis labore obcaecati, reprehenderit repellat est omnis totam ipsum optio itaque?" }
        available { true }
        pharmacy_id { 2 }
        first_image_temp { "https://www.aquaportail.com/pictures1801/medicaments.jpg" }
        second_image_temp { "https://ui-sam.unimedias.fr/build/vendor/unieditions/common/src/Ue/CoreBundle/Resources/public/img/doctype/drug.ad7f8253.jpg"  }
    end
end

