# encoding: utf-8

# https://api.crunchbase.com/v/2/organization/#{permalink}/primary_image

module Crunchbase
  class PrimaryImage < CBEntity
    
    RESOURCE_LIST = 'primary_image'

    attr_reader :type_name, :title, :path, :original_path, :created_at, :updated_at
    
    def initialize(json)
      @type_name      = json['type']
      @title          = json['title']
      @original_path  = json['path']
      @path           = json['path'] && (Crunchbase::API.image_url + json['path'])
      @created_at     = Time.at(json['created_at']).utc
      @updated_at     = Time.at(json['updated_at']).utc
    end

  end
end