# encoding: utf-8

# https://api.crunchbase.com/v/2/organization/facebook/headquarters

module Crunchbase
  class Headquarter < CBEntity

    RESOURCE_LIST = 'headquarters'

    attr_reader :type_name, :name, :street_1, :street_2, :postal_code, :city, :city_path,
                :region, :region_path, :country, :country_path, :latitude, :longitude,
                :created_at, :updated_at

    def initialize(json)
      @type_name      = json['type']
      @name           = json['name']
      @street_1       = json['street_1']
      @street_2       = json['street_2']
      @postal_code    = json['postal_code']
      @city           = json['city']
      @city_path      = json['city_path']
      @region         = json['region']
      @region_path    = json['region_path']
      @country        = json['country']
      @country_path   = json['country_path']
      @latitude       = json['latitude']
      @longitude      = json['longitude']
      @created_at     = Time.at(json['created_at']).utc
      @updated_at     = Time.at(json['updated_at']).utc
    end

  end
end
