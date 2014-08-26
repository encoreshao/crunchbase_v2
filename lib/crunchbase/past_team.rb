# encoding: utf-8

# From organization Top 8 past_teams
# "past_team": {
#   "paging": {
#    "total_items": 186,
#    "first_page_url": "http://api.crunchbase.com/v/2/organization/facebook/past_team",
#    "sort_order": "created_at DESC"
#   },
#   "items": [
#    {
#     "first_name": "Randi",
#     "last_name": "Zuckerberg",
#     "title": "Director of Market Development and Spokeswoman",
#     "started_on": null,
#     "ended_on": null,
#     "path": "person/randi-zuckerberg",
#     "created_at": 1233300345,
#     "updated_at": 1408498780
#    }
#   ]
#  }

# http://api.crunchbase.com/v/2/organization/facebook/past_team
require 'date'

module Crunchbase
  class PastTeam < CBEntity
    RESOURCE_LIST = 'past_team'

    attr_reader :type_name, :first_name, :last_name, :path, :permalink, :title, :started_on, 
                :ended_on, :created_at, :updated_at

    def initialize(json)
      @type_name      = json['type']
      @first_name     = json['first_name']
      @last_name      = json['last_name']
      @path           = json['path']
      @permalink      = (json['permalink'] || json['path'].gsub('person/', ''))
      @title          = json['title']
      @started_on     = json['started_on'] && DateTime.parse(json['started_on'])
      @ended_on       = json['ended_on'] && DateTime.parse(json['ended_on'])
      @created_at     = Time.at(json['created_at']).utc
      @updated_at     = Time.at(json['updated_at']).utc
    end

  end
end