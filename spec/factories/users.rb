FactoryBot.define do
  factory :user do
    id {1}
    name {"username"}
    email { 'username@example.com' }
    city {"Cotonou"}
    quartier {"Sainte Rita"}
    user_role {"Patient"}
    password { 'password' }
  end
end

FactoryBot.define do
  factory :second_user, class: User do
    id {2}
    name {"username2"}
    email { 'username2@example.com' }
    city {"Cotonou"}
    quartier {"Sainte Rita"}
    user_role {"Pharmacien"}
    password { 'password' }
  end
end

FactoryBot.define do
  factory :third_user, class: User do
    id {3}
    name {"username3"}
    email { 'username3@example.com' }
    city {"Parakou"}
    quartier {"Oké dama"}
    user_role {"Pharmacien"}
    password { 'password' }
  end
end

FactoryBot.define do
  factory :f_user, class: User do
    id {4}
    name {"username4"}
    email { 'username4@example.com' }
    city {"Parakou"}
    quartier {"Oké dama"}
    user_role {"Admin"}
    password { 'password' }
  end
end