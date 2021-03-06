class User < ApplicationRecord

    validates :name, presence: true
 
    # #Validates email 
    before_save {self.email = email.downcase}
    validates :name, presence: true, length: { maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence:true, length: {maximum:255},
                      format: {with: VALID_EMAIL_REGEX},
                      uniqueness: {case_sensitive:false}

    #Password
    has_secure_password
    validates :password, presence: true, length: {minimum: 3}
    
    has_many :activities, dependent: :destroy
    has_many :comments, dependent: :destroy
end
