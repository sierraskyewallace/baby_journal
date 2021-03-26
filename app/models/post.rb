class Post < ActiveRecord::Base
    belongs_to :baby
    belongs_to :user
    validates :title, presence: true 
    validates :height, presence: true
    validates :summary, presence: true

  end
