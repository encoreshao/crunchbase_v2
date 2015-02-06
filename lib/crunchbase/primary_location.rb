# encoding: utf-8

# https://api.crunchbase.com/v/2/person/reed-hastings/primary_location

module Crunchbase
  class PrimaryLocation < CBEntity
    
    RESOURCE_LIST = 'primary_location'

    attr_reader :type_name, :name, :uuid, :path, :created_at, :updated_at
    
    def initialize(json)
      @type_name      = json['type']
      @name           = json['name']
      @uuid           = json['uuid']
      @path           = json['path']
      @created_at     = Time.at(json['created_at']).utc
      @updated_at     = Time.at(json['updated_at']).utc
    end

  end
end