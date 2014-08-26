# encoding: utf-8

# "websites": {
# "paging": {
#  "total_items": 6,
#  "first_page_url": "http://api.crunchbase.com/v/2/organization/facebook/websites",
#  "sort_order": "created_at DESC"
# },
# "items": [
#  {
#   "url": "http://www.facebook.com/facebook",
#   "type": "WebPresence",
#   "title": "facebook",
#   "created_at": 1406445972,
#   "updated_at": 1406445972
#  }
# ]
# }

module Crunchbase
  class Website < CBEntity
    RESOURCE_NAME = 'website'
    RESOURCE_LIST = 'websites'

    attr_reader :url, :type_name, :title, :created_at, :updated_at

    def initialize(json)
      @url            = json['url']
      @type_name      = json['type']
      @title          = json['title']
      @created_at     = Time.at(json['created_at']).utc
      @updated_at     = Time.at(json['updated_at']).utc
    end
  end
end