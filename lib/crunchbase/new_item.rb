# encoding: utf-8

# "news": {
#  "paging": {
#   "total_items": 3113,
#   "first_page_url": "http://api.crunchbase.com/v/2/organization/facebook/news",
#   "sort_order": "created_at DESC"
#  },
#  "items": [
#   {
#    "url": "http://techcrunch.com/2014/08/14/why-ferguson-wasnt-trending-for-some-social-media-users-lastnight/",
#    "author": null,
#    "posted_on": "2014-08-14",
#    "type": "PressReference",
#    "title": "Why #Ferguson Wasn’t Trending For Some Social Media Users Last Night | TechCrunch",
#    "created_at": 1408085709,
#    "updated_at": 1408085710
#   }
#  ]
# }

module Crunchbase
  class NewItem < CBEntity
    RESOURCE_LIST = 'news'

    attr_reader :type_name, :url, :author, :posted_on, :type, :title, :created_at, 
                :updated_at
                
    def initialize(json)
      @type_name      = json['type']
      @url            = json['url']
      @author         = json['author']
      @posted_on      = json['posted_on'] && DateTime.parse(json['posted_on'])
      @title          = json['title']
      @created_at     = json['created_at']
      @updated_at     = json['updated_at']
    end
  end
end