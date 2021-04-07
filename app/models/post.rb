class Post < ActiveRecord::Base
    belongs_to :baby
    belongs_to :user
    validates :title, presence: true 
    validates :height, numericality: { only_integer: true }
    validates :weight, numericality: { only_integer: true }
    validates :summary, presence: true
  end
