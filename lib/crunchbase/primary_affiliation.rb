# encoding: utf-8

# https://api.crunchbase.com/v/2/person/#{permalink}/primary_affiliation?user_key=#{user_key}

module Crunchbase
  class PrimaryAffiliation < CBEntity
    RESOURCE_LIST = 'primary_affiliation'
    
    attr_reader :organization_name, :organization_path, :organization_permalink, :title, :started_on, :ended_on

    def initialize(json)
      @organization_name        = json['organization_name']
      @organization_permalink   = (json['organization_path'] && json['organization_path'].gsub('organization/', '') || nil)
      @organization_path        = json['organization_path']
      @title                    = json['title']
      @started_on               = (json['started_on'] && json['started_on'].to_datetime.utc || nil)
      @ended_on                 = (json['ended_on'] && json['ended_on'].to_datetime.utc || nil)
    end

  end
end