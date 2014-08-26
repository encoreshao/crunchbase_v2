# encoding: utf-8

# Search by product permalink
# "data": {
# "properties": {
#  "lifecycle_stage": "live",
#  "owner_id": "df6628127f970b439d3e12f64f504fbb",
#  "short_description": "Everyone of us. Everywhere. Connected.",
#  "permalink": "internet-org",
#  "name": "Internet.org",
#  "homepage_url": "http://internet.org",
#  "description": "Internet.org is a global partnership between technology leaders",
#  "launched_on_day": 1,
#  "launched_on_month": 8,
#  "launched_on_year": 2013,
#  "launched_on": "2013-08-01",
#  "launched_on_trust_code": 6,
#  "created_at": 1406929558,
#  "updated_at": 1406929776
# }

# Here: search by organization permalink, return top 8 products
# "products": {
#  "paging": {
#   "total_items": 17,
#   "first_page_url": "http://api.crunchbase.com/v/2/organization/facebook/products",
#   "sort_order": "created_at DESC"
#  },
#  "items": [
#   {
#    "type": "Product",
#    "name": "Internet.org",
#    "path": "product/internet-org",
#    "created_at": 1406929558,
#    "updated_at": 1406929776
#   }
#  ]
# }

require 'date'

module Crunchbase
  class Product < CBEntity
    RESOURCE_NAME = 'product'
    RESOURCE_LIST = 'products'

    attr_reader :type_name, :lifecycle_stage, :owner_id, :short_description, :permalink, :name, 
                :homepage_url, :description, :launched_on, :launched_on_trust_code, 
                :created_at, :updated_at

    attr_reader :primary_images, :images, :websites, :new_items
    attr_reader :primary_images_total_items, :images_total_items, :websites_total_items, 
                :new_items_total_items

    def initialize(json)
      properties          = json['properties']
      relationships       = json['relationships']
      
      @type_name          = properties['type']
      @name               = properties['name']
      @lifecycle_stage    = properties['lifecycle_stage']
      @owner_id           = properties['owner_id']
      @short_description  = properties['short_description']
      @permalink          = properties['permalink']
      @homepage_url       = properties['homepage_url']
      @description        = properties['description']
      @launched_on        = properties['launched_on'] && DateTime.parse(properties['launched_on'])
      @created_at         = Time.at(properties['created_at']).utc
      @updated_at         = Time.at(properties['updated_at']).utc
      @launched_on_trust_code = properties['launched_on_trust_code']


      @primary_images_list  = relationships['primary_image']
      @images_list          = relationships['images']
      @websites_list        = relationships['websites']
      @new_items_list       = relationships['news']
    end

    def primary_images
      @primary_images ||= PrimaryImage.array_from_list(@primary_images_list)
    end

    def images
      @images ||= Image.array_from_list(@images_list)
    end

    def websites
      @websites ||= Website.array_from_list(@websites_list)
    end

    def new_items
      @new_items ||= NewItem.array_from_list(@new_items_list)
    end

    def primary_images_total_items
      @primary_images_total_items ||= PrimaryImage.total_items_from_list(@primary_images_list)
    end

    def images_total_items
      @images_total_items ||= Image.total_items_from_list(@images_list)
    end

    def websites_total_items
      @websites_total_items ||= Website.total_items_from_list(@websites_list)
    end

    def new_items_total_items
      @new_items_total_items ||= NewItem.total_items_from_list(@new_items_list)
    end

  end

end