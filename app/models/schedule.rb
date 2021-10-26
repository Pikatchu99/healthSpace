class Schedule < ApplicationRecord
    validates :lundi, presence: {message: " doit être définie.!", }
    validates :mardi, presence: {message: " doit être définie.!", }
    validates :mercredi, presence: {message: " doit être définie.!", }
    validates :jeudi, presence: {message: " doit être définie.!", }
    validates :vendredi, presence: {message: " doit être définie.!", }
    validates :samedi, presence: {message: " doit être définie.!", }
    validates :dimanche, presence: {message: " doit être définie.!", }
    belongs_to :pharmacy, optional: true
end
