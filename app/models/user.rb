class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :pharmacy
  has_many :favorites, dependent: :destroy
  has_many :favorite_pharmacies, through: :favorites, source: :pharmacy

  validates :user_role, presence: true, if: :validate_role?

  def validate_role?
    if user_role == 'Patient' || user_role == 'Pharmacien'
      false
    else
      true
    end
  end
end
