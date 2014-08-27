# encoding: utf-8

# http://api.crunchbase.com/v/2/organization/facebook/news

module Crunchbase
  class NewItem < CBEntity
    RESOURCE_LIST = 'news'

    attr_reader :type_name, :url, :author, :posted_on, :type, :title, :created_at, 
                :updated_at
                
    def initialize(json)
      @type_name      = json['type']
      @url            = json['url']
      @author         = json['author']
      @posted_on      = json['posted_on'] && DateTime.parse(json['posted_on'])
      @title          = json['title']
      @created_at     = json['created_at']
      @updated_at     = json['updated_at']
    end
  end
end