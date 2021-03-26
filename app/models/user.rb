class User < ActiveRecord::Base
    has_secure_password 
    has_many :babies 
    has_many :posts

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create}

    def find_by_slug(slug)
        self.all.find{|username| username.slug == slug}
    end
    def slug
        self.username.downcase.gsub(" ", "-")
    end
 end

