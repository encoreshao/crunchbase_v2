# encoding: utf-8

# http://api.crunchbase.com/v/2/organization/facebook/categories?user_key=key
module Crunchbase
  class Category < CBEntity
    RESOURCE_NAME = 'category'
    RESOURCE_LIST = 'categories'

    attr_reader :type_name, :name, :uuid, :path, :created_at, :updated_at, :number_of_organizations

    def initialize(json)
      @type_name    = json['type']
      @name         = json['name']
      @uuid         = json['uuid']
      @path         = json['path']
      @created_at   = Time.at(json['created_at']).utc
      @updated_at   = Time.at(json['updated_at']).utc
      @number_of_organizations = json['number_of_organizations']
    end

  end

end