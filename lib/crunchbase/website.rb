# encoding: utf-8

# https://api.crunchbase.com/v/2/#{classify}/#{permalink}/websites
# Type [organization, person]

module Crunchbase
  class Website < CBEntity

    RESOURCE_NAME = 'website'
    RESOURCE_LIST = 'websites'

    attr_reader :url, :type_name, :title, :created_at, :updated_at

    def initialize(json)
      @url            = json['url']
      @type_name      = json['type']
      @title          = json['title']
      @created_at     = Time.at(json['created_at']).utc
      @updated_at     = Time.at(json['updated_at']).utc
    end
    
  end
end