# encode: utf-8

# "board_members_and_advisors": {
#   "paging": {
#    "total_items": 12,
#    "first_page_url": "http://api.crunchbase.com/v/2/organization/facebook/board_members_and_advisors",
#    "sort_order": "created_at DESC"
#   },
#   "items": [
#    {
#     "first_name": "Marc",
#     "last_name": "Andreessen",
#     "title": "Member of the Board of Directors",
#     "started_on": null,
#     "path": "person/marc-andreessen",
#     "created_at": 1194976730,
#     "updated_at": 1405353255
#    }
# }

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