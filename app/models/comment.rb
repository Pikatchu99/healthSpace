class Comment < ApplicationRecord
    belongs_to :pharmacy
    validates :content, presence: {message: " doit être définie.!", }
end
