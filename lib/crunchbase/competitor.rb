# encoding: utf-8

# http://api.crunchbase.com/v/2/organization/facebook/competitors

module Crunchbase
  class Competitor < CBEntity
    RESOURCE_LIST = 'competitors'
    
    attr_reader :type_name, :name, :last_name, :permalink, :title, :started_on, :ended_on, 
                :created_at, :updated_at

    def initialize(json)
      @type_name    = json['type']
      @name         = (json['name'] || (json['first_name'] + ' ' + json['last_name']))
      @permalink    = (json['permalink'] || (json['path'] || json['path'].gsub('organization/', '')))
      @title        = json['title']
      @started_on   = json['started_on']
      @ended_on     = json['ended_on']
      @created_at   = Time.at(json['created_at']).utc
      @updated_at   = Time.at(json['updated_at']).utc
    end

  end

end