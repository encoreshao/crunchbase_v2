# encode: utf-8

# "primary_image": {
# "paging": {
#  "total_items": 1,
#  "first_page_url": "http://api.crunchbase.com/v/2/organization/facebook/primary_image",
#  "sort_order": "created_at DESC"
# },
# "items": [
#  {
#   "type": "ImageAsset",
#   "title": null,
#   "path": "image/upload/v1408491700/ypqf483smhnqo0rh6mff.png",
#   "created_at": 1398018467,
#   "updated_at": 1408491702
#  }
# ]
# }

module Crunchbase
  class Image < CBEntity
    RESOURCE_NAME = 'image'
    RESOURCE_LIST = 'images'

    attr_reader :type_name, :title, :path, :created_at, :updated_at
    
    def initialize(json)
      @type_name      = json['type']
      @title          = json['title']
      @path           = json['path']
      @created_at     = Time.at(json['created_at']).utc
      @updated_at     = Time.at(json['updated_at']).utc
    end
  end
end