class Update < ActiveRecord::Base
    belongs_to :baby

    def self.valid_params?(params)
        return !params[:name].empty? && !params[:manufacturer].empty?
      end
    end
