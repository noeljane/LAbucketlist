class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness:true
    has_many :activities, dependent: :destroy
    has_many :comments, dependent: :destroy
end
