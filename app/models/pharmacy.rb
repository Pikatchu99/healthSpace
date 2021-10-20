class Pharmacy < ApplicationRecord
    belongs_to :user, optional: true
    has_many :products, dependent: :destroy
    has_many :schedules
    has_many :comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user
end
