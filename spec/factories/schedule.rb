FactoryBot.define do
    factory :schedule do
        id { 1 }
        lundi {"8h à 00h"}
        mardi {"8h à 00h"}
        mercredi {"8h à 00h"}
        jeudi {"8h à 00h"}
        vendredi {"8h à 00h"}
        samedi { '8h à 00h' }
        dimanche { '8h à 00h' }
        pharmacy_id { 1 }
    end
end
  
FactoryBot.define do
    factory :second_schedule, class: Schedule do
        id { 2 }
        lundi {"8h à 00h"}
        mardi {"8h à 00h"}
        mercredi {"8h à 00h"}
        jeudi {"8h à 00h"}
        vendredi {"8h à 00h"}
        samedi { '8h à 00h' }
        dimanche { '8h à 00h' }
        pharmacy_id { 2 }
    end
end

  
FactoryBot.define do
    factory :third_schedule, class: Schedule do
        id { 3 }
        lundi {"8h à 00h"}
        mardi {"8h à 00h"}
        mercredi {"8h à 00h"}
        jeudi {"8h à 00h"}
        vendredi {"8h à 00h"}
        samedi { '8h à 00h' }
        dimanche { '8h à 00h' }
        pharmacy_id { 3 }
    end
end