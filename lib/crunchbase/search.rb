# encoding: utf-8

# curl -v  -X GET "http://api.crunchbase.com/v/2/organizations?domain_name=facebook.com&organization_types=company&user_key=21062a0a83fec3591daa3796ce83d93e&page=1"
# {
#  "metadata": {
#   "image_path_prefix": "http://images.crunchbase.com/",
#   "www_path_prefix": "http://www.crunchbase.com/",
#   "api_path_prefix": "http://api.crunchbase.com/v/2/",
#   "version": 2
#  },
#  "data": {
#   "paging": {
#    "items_per_page": 1000,
#    "current_page": 1,
#    "number_of_pages": 1,
#    "next_page_url": null,
#    "prev_page_url": null,
#    "total_items": 109,
#    "sort_order": "custom"
#   },
#   "items": [
#    {
#     "updated_at": 1407926378,
#     "created_at": 1180153335,
#     "path": "organization/facebook",
#     "name": "Facebook",
#     "type": "Organization"
#    }
#   ]
#  }
# }

module Crunchbase
  class Search
    include Enumerable
    
    attr_reader :size, :path, :results
    alias :length :size
    
    # Performs a Crunchbase search for query.
    def self.find(query)
      j = API.search(query)
      real_find query, j
    end

    def self.find_company(query, page=1)
      j = API.search_with_company(query, page)
      real_find query, j
    end

    def self.real_find(query, j)
      Search.new(query, j)
    end
    
    def initialize(query, json)
      @query = query
      @results = []
      @size = json["total"]
      @crunchbase_url = json["crunchbase_url"]
      populate_results(json)
    end
    
    def [](*args)
      case args.length
      when 1
        key = args[0]
        if key.kind_of?(Integer)
          get_single_key(key)
        elsif key.kind_of?(Range)
          get_range(key)
        end
      when 2
        start = args[0]
        length = args[1]
        start = @size + start if start < 0
        get_range(start..start+length-1)
      end
    end
    
    # Returns array of all search results (not just ones currently loaded.)
    # This enables the user to take advantage of all Array methods, not just
    # the ones implmented on Search.
    def to_ary
      self.map{|result| result}
    end
    
    # Calls _block_ once for each search result, passing that item as a
    # parameter.
    def each(&block) # :yields: result
      0.upto(@size - 1) {|x| yield self[x]}
    end
    
    private
    
    # Inserts items into the results array from the retrieved search page
    def populate_results(json)
      # page = json["page"]
      # results = json["results"].map{|r| SearchResult.new(r)}
      # start = (page - 1) * 10
      # @results[start, results.length] = results
      @results = json["results"].map{|r| SearchResult.new(r)}
    end

    # Retrieves the search page containing the given index
    def retrieve_for_index(index)
      page = (index / 10) + 1
      populate_results(API.search(@query, page))
    end

    # Given one integer key, returns the indexed object from results
    def get_single_key(key)
      key = @size+key if key < 0
      r = @results[key]
      unless r.nil? && key < @size
        r
      else
        retrieve_for_index(key)
        @results[key]
      end
    end

    # Given a range, returns the array slice of results indicated
    def get_range(range)
      r = []
      enum = range.to_enum
      begin
        while (x = enum.next) < @size
          r << get_single_key(x)
        end
      rescue StopIteration
      end
      r.empty? ? nil : r
    end
    
  end
end
