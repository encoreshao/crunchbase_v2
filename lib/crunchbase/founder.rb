# encoding: utf-8

# https://api.crunchbase.com/v/2/organization/#{permalink}/founders?user_key=key

module Crunchbase
  class Founder < CBEntity
    
    RESOURCE_LIST = 'founders'
    
    attr_reader :type_name, :name, :path, :permalink, :created_at, :updated_at

    def initialize(json)
      @type_name      = json['type']
      @name           = json['name']
      @path           = json['path']
      @permalink      = (json['path'] && json['path'].gsub('person/', ''))
      @created_at     = Time.at(json['created_at']).utc
      @updated_at     = Time.at(json['updated_at']).utc
    end

  end
end