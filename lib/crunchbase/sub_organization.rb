# encoding: utf-8

# http://api.crunchbase.com/v/2/organization/facebook/sub_organizations

module Crunchbase
  class SubOrganization < CBEntity
    RESOURCE_LIST = 'sub_organizations'

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