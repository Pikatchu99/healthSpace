class Product < ApplicationRecord
    validates :name, presence: true,  length: {minimum: 4, maximum: 150}
    validates :description, length: {minimum: 50, maximum: 500}
    # validates :first_image, presence: true
    # validates :second_image, presence: true

    belongs_to :pharmacy
    mount_uploader :first_image, FirstImageUploader
    mount_uploader :second_image, SecondImageUploader

    scope  :find_product, -> (search_key){where("name LIKE ?","%#{search_key}%")}
    scope  :find_availability, -> (available){where(available: available )}
    
    paginates_per 10
end
