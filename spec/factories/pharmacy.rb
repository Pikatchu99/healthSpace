FactoryBot.define do
    factory :pharmacy do
        id {1}
        name {"Pharmacy la Grâce"}
        contact { '96560024' }
        whatsapp { '96560024' }
        user_id { 1 }
        city {"Cotonou"}
        quartier {"Sainte Rita"}
    end
end
  
FactoryBot.define do
  factory :second_pharmacy, class: Pharmacy do
      id {2}
      name {"Pharmacy Tokpa"}
      contact { '96560024' }
      whatsapp { '96560024' }
      user_id { 2 }
      city {"Cotonou"}
      quartier {"Sainte Rita"}
  end
end

FactoryBot.define do
    factory :third_pharmacy, class: Pharmacy do
        id {3}
        name {"Pharmacy Parakou"}
        contact { '96560024' }
        whatsapp { '96560024' }
        user_id { 3 }
        city {"Parakou"}
        quartier {"Oké dama"}
    end
end