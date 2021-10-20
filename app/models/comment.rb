class Comment < ApplicationRecord
    belongs_to :pharmacy
    validates :content, presence: true
end
