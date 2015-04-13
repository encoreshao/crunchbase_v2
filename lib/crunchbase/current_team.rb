# encoding: utf-8

# https://api.crunchbase.com/v/2/organization/#{permalink}/current_team

module Crunchbase
  class CurrentTeam < CBEntity
    
    RESOURCE_LIST = 'current_team'

    attr_reader :type_name, :name, :first_name, :last_name, :path, :permalink, :title,
                :started_on, :ended_on, :created_at, :updated_at

    def initialize(json)
      @type_name    = json['type']
      @name         = json['first_name'].to_s + ' ' + json['last_name'].to_s
      @first_name   = json['first_name']
      @last_name    = json['last_name']
      @path         = json['path']
      @permalink    = (json['permalink'] || (json['path'] && json['path'].gsub('person/', '')))
      @title        = json['title']
      @started_on   = json['started_on']
      @ended_on     = json['ended_on']
      @created_at   = Time.at(json['created_at']).utc
      @updated_at   = Time.at(json['updated_at']).utc
    end

  end
end