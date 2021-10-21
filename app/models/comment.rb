class Comment < ApplicationRecord
    belongs_to :pharmacy
    validates :content, presence: true, length: {minimum: 5, maximum: 100}
end
