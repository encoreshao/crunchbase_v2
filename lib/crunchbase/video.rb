# encoding: utf-8

# https://api.crunchbase.com/v/2/person/{permalink}/videos

module Crunchbase
  class Video < CBEntity

    RESOURCE_LIST = 'videos'

    attr_reader :type_name, :title, :created_at, :updated_at

    def initialize(json)
      @type_name      = json['type']
      @title          = json['title']
      @created_at     = Time.at(json['created_at']).utc
      @updated_at     = Time.at(json['updated_at']).utc
    end
    
  end
end