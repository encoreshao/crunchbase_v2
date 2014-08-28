# encoding: utf-8

# http://api.crunchbase.com/v/2/organization/facebook/customers

module Crunchbase
  class Customer < CBEntity
    RESOURCE_LIST = 'customers'
    
    attr_reader :type_name, :name, :permalink, :path, :created_at, :updated_at

    def initialize(json)
      @type_name    = json['type']
      @name         = json['name']
      @path         = json['path']
      @permalink    = json['path'] && json['path'].gsub('organization/', '')
      @created_at   = Time.at(json['created_at']).utc
      @updated_at   = Time.at(json['updated_at']).utc
    end

  end

end