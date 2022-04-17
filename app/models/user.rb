class User < ApplicationRecord
  #パスワードのセキュリティのために記述
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }

   has_many :company_name, dependent: :destroy
   has_many :post, dependent: :destroy
end
