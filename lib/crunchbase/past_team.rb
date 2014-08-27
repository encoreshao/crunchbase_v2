# encoding: utf-8

# http://api.crunchbase.com/v/2/organization/facebook/past_team
require 'date'

module Crunchbase
  class PastTeam < CBEntity
    RESOURCE_LIST = 'past_team'

    attr_reader :type_name, :name, :first_name, :last_name, :path, :permalink, :title, :started_on, 
                :ended_on, :created_at, :updated_at

    def initialize(json)
      @type_name      = json['type']
      @name           = json['first_name'].to_s + ' ' + json['last_name'].to_s
      @first_name     = json['first_name']
      @last_name      = json['last_name']
      @path           = json['path']
      @permalink      = (json['permalink'] || (json['path'] && json['path'].gsub('person/', '')))
      @title          = json['title']
      @started_on     = json['started_on'] && DateTime.parse(json['started_on'])
      @ended_on       = json['ended_on'] && DateTime.parse(json['ended_on'])
      @created_at     = Time.at(json['created_at']).utc
      @updated_at     = Time.at(json['updated_at']).utc
    end

  end
end