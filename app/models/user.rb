class User < ApplicationRecord
  #パスワードのセキュリティのために記述
  has_secure_password
end
