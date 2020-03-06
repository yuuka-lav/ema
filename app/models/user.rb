class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name,:first_name,:first_name_yomi,:last_name,:last_name_yomi,:birthday,:prefecture,:city,:address,:zipcode, presence: true

end
