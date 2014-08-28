# encoding: utf-8

module Crunchbase
  class Location < CBEntity
    
    RESOURCE_NAME = 'location'
    RESOURCE_LIST = 'locations'

    attr_reader :location_type, :name, :path, :parent_location_uuid, :uuid, 
                :type_name, :created_at, :updated_at

    def initialize(json)
      @location_type        = json['location_type']
      @name                 = json['name']
      @path                 = json['path']
      @parent_location_uuid = json['parent_location_uuid']
      @uuid                 = json['uuid']
      @type_name            = json['type']
      @created_at           = Time.at(json['created_at']).utc
      @updated_at           = Time.at(json['updated_at']).utc
    end

  end
end