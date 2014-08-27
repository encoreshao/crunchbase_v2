# encode: utf-8

# http://api.crunchbase.com/v/2/organization/facebook/board_members_and_advisors

module Crunchbase
  class BoardMembersAndAdvisor < CBEntity
    RESOURCE_LIST = 'board_members_and_advisors'

    attr_reader :type_name, :first_name, :last_name, :title, :started_on, :path, 
                :created_at, :updated_at
    
    def initialize(json)
      @type_name    = json['type']
      @first_name   = json['first_name']
      @last_name    = json['last_name']
      @title        = json['title']
      @path         = json['path']
      @started_on   = json['started_on'] && DateTime.parse(json['started_on'])
      @created_at   = Time.at(json['created_at']).utc
      @updated_at   = Time.at(json['updated_at']).utc
    end
  end
end