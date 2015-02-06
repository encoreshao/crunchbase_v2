# encoding: utf-8

# https://api.crunchbase.com/v/2/person/#{permalink}/experience?user_key=key

module Crunchbase
  class Experience < CBEntity
    RESOURCE_LIST = 'experience'
    
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