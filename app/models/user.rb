class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :comments
  has_many :items, dependent: :destroy
  has_one :creditcard
  has_many :favorites
  has_many :items, through: :favorites


  validates :name,:first_name,:first_name_yomi,:last_name,:last_name_yomi,:birthday,:prefecture,:city,:address,:zipcode, presence: true
  validates :first_name, :last_name, format: { with:  /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_yomi, :last_name_yomi, format: { with: /\A[ァ-ンー－]+\z/ }
  validates :email, format: { with: /\A\S+@\S+\.\S+\z/ }
  
end
