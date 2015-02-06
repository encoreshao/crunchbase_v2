# encoding: utf-8

# https://api.crunchbase.com/v/2/organization/facebook/offices

module Crunchbase
  class Office < CBEntity

    RESOURCE_LIST = 'offices'

    attr_reader :type_name, :name, :street_1, :street_2, :city, :city_uuid, :city_path, 
                :region, :country_code, :created_at, :updated_at
                
    def initialize(json)
      @type_name    = json['type']
      @name         = json['name']
      @street_1     = json['street_1']
      @street_2     = json['street_2']
      @city         = json['city']
      @city_uuid    = json['city_uuid']
      @city_path    = json['city_path']
      @region       = json['region']
      @country_code = json['country_code']
      @created_at   = Time.at(json['created_at']).utc
      @updated_at   = Time.at(json['updated_at']).utc
    end

  end
end