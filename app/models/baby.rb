class Baby < ActiveRecord::Base
    belongs_to :user 
    has_many :updates

    def self.valid_params?(params)
        return !params[:name].empty? && !params[:caagepacity].empty?
      end
    end
