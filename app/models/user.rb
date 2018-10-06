class User < ApplicationRecord
  before_save {self.email = email.downcase}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :first_name,
  presence: true,
  length: {minimum: 3, maximum: 40}

  validates :last_name,
  presence: true,
  length: {maximum: 40}

  validates :email,
  presence:true,
  length: {maximum: 100},
  format: {with: VALID_EMAIL_REGEX},
  uniqueness: true

validates_date :dob,
  :before => lambda {13.years.ago},
  :before_message => "Must be at least 13 years old to sign up."

  validates :password,
  presence: true,
  length: {minimum: 6}

  has_secure_password
end
