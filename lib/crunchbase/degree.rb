# encoding: utf-8

# https://api.crunchbase.com/v/2/person/#{permalink}/degrees?user_key=key

module Crunchbase
  class Degree < CBEntity
    RESOURCE_LIST = 'degrees'
    
    attr_reader :started_on, :completed_on, :degree_type_name, :degree_subject, 
                :type_name, :organization_name, :organization_path, :organization_permalink

    def initialize(json)
      @type_name              = json['type']
      @organization_name      = json['organization_name']
      @organization_permalink = (json['organization_path'] && json['organization_path'].gsub('organization/', '') || nil)
      @organization_path      = json['organization_path']
      @degree_type_name       = json['degree_type_name']
      @degree_subject         = json['degree_subject']
      @started_on             = (json['started_on'] && json['started_on'].to_datetime.utc || nil)
      @completed_on           = (json['completed_on'] && json['completed_on'].to_datetime.utc || nil)
    end

  end
end