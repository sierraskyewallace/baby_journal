class Baby < ActiveRecord::Base 
    belongs_to :user 
    has_many :posts
    validates :name, presence: true 
    validates :age, numericality: { only_integer: true }
    validates :gender, presence: true

end
