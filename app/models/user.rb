class User < ApplicationRecord
  #パスワードのセキュリティのために記述
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true

   has_many :company_name, dependent: :destroy
end
