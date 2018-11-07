class User < ApplicationRecord
  has_many :user_books
  has_many :books, through: :user_books
  has_secure_password

  #validations [first_name, last_name, user_name, password]
end
