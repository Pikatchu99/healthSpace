class Product < ApplicationRecord
    belongs_to :pharmacy
    mount_uploader :first_image, FirstImageUploader
    mount_uploader :second_image, SecondImageUploader

    scope  :find_product, -> (search_key){where("name LIKE ?","%#{search_key}%")}
    scope  :find_availability, -> (available){where(available: available )}
end
