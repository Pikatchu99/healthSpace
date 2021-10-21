class Pharmacy < ApplicationRecord
    # before_validation :parsing
    validates :name, presence: {message: " doit être définie.!", }
    validates :contact, phone: { possible: true, allow_blank: false, types: [:voip, :mobile], countries: :bj }
    validates :whatsapp, phone: { possible: true, allow_blank: false, types: [:voip, :mobile], countries: :bj }
    validates :city, presence: {message: " doit être définie.!", }
    validates :quartier, presence: {message: " doit être définie.!", }

    belongs_to :user, optional: true
    has_many :products, dependent: :destroy
    has_many :schedules, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user

    scope  :find_name, -> (search_key){where("name LIKE ?","%#{search_key}%")}
    scope  :find_city, -> (search_key){where("city LIKE ?","%#{search_key}%")}
    scope  :find_quartier, -> (search_key){where("quartier LIKE ?","%#{search_key}%")}

    paginates_per 10
    # private
end
