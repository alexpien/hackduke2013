class User < ActiveRecord::Base
	has_many :stashes, dependent: :destroy
	before_save { self.email = email.downcase }
	before_save { self.name = name.downcase }
	has_secure_password  

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
VALID_USERNAME_REGEX = /\A[\S]+\Z/

validates :name,  presence: true, format: { with: VALID_USERNAME_REGEX }, uniqueness: { case_sensitive: false }
validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
validates :password,  presence: true

end
