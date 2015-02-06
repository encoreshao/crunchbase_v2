# encoding: utf-8

# https://api.crunchbase.com/v/2/person/#{permalink}/founded_companies

module Crunchbase
  class FoundedCompany < CBEntity
    
    RESOURCE_LIST = 'founded_companies'

    attr_reader :type_name, :name, :path, :permalink, :created_at, :updated_at

    def initialize(json)
      @type_name      = json['type']
      @name           = json['name']
      @path           = json['path']
      @permalink      = json['path'] && json['path'].gsub('organization/', '')
      @created_at     = Time.at(json['created_at']).utc
      @updated_at     = Time.at(json['updated_at']).utc
    end

  end
end