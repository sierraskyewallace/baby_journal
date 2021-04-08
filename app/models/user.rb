class User < ActiveRecord::Base
    has_secure_password 
    has_many :babies 
    has_many :posts

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create}

end


