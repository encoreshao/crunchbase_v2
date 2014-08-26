# encoding: utf-8

# http://api.crunchbase.com/v/2/organization/facebook/customers
# {
#   data: {
#     paging: {
#       total_items: 1,
#       items_per_page: 1000,
#       number_of_pages: 1,
#       current_page: 1,
#       next_page_url: null,
#       prev_page_url: null,
#       sort_order: "created_at desc"
#     },
#     items: [
#       {
#         type: "Organization",
#         name: "Ouyeaa",
#         path: "organization/ouyeaa",
#         created_at: 1408010328,
#         updated_at: 1408886609
#       }
#     ]
#   }
# }

module Crunchbase
  class Customer < CBEntity
    RESOURCE_LIST = 'customers'
    
    attr_reader :type_name, :name, :path, :created_at, :updated_at

    def initialize(json)
      @type_name    = json['type']
      @name         = json['name']
      @path         = json['path']
      @created_at   = Time.at(json['created_at']).utc
      @updated_at   = Time.at(json['updated_at']).utc
    end

  end

end