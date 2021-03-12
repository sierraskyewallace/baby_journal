class Post < ActiveRecord::Base
    belongs_to :baby
    belongs_to :user

    def self.valid_params?(params)
      return !params[:weight].empty? && !params[:height].empty? && !params[:summary].empty?
      end
    end
