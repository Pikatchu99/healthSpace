class Product < ApplicationRecord
    belongs_to :pharmacy
    mount_uploader :first_image, FirstImageUploader
    mount_uploader :second_image, SecondImageUploader
end
