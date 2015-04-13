# encoding: utf-8

# https://api.crunchbase.com/v/2/organization/#{permalink}/competitors

module Crunchbase
  class Competitor < CBEntity
    
    RESOURCE_LIST = 'competitors'
    
    attr_reader :type_name, :name, :last_name, :path, :permalink, :title, :started_on, :ended_on, 
                :created_at, :updated_at

    def initialize(json)
      @type_name    = json['type']
      @name         = (json['name'] || (json['first_name'].to_s + ' ' + json['last_name'].to_s))
      @path         = json['path']
      @permalink    = (json['permalink'] || (json['path'] && json['path'].gsub('organization/', '')))
      @title        = json['title']
      @started_on   = json['started_on']
      @ended_on     = json['ended_on']
      @created_at   = Time.at(json['created_at']).utc
      @updated_at   = Time.at(json['updated_at']).utc
    end

  end
end