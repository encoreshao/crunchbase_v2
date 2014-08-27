# encoding: utf-8

# http://api.crunchbase.com/v/2/organizations?domain_name=facebook.com&organization_types=company&user_key=key&page=1

module Crunchbase
  class Search
    include Enumerable
    
    attr_reader :total_items, :per_page, :pages, :current_page, 
                :prev_page_url, :next_page_url, :sort_order, :results

    alias :length :total_items
    alias :size   :total_items
    alias :items  :results

    # Performs a Crunchbase search for query.
    def self.find(query)
      search(query)
    end

    def self.search(query, t='organizations')
      query = { name: query } unless query.kind_of?(Hash)

      Search.new query, API.search(query, t), SearchResult
    end

    def initialize(query, json, _model)
      @query            = query
      @results          = []
      @total_items      = json['paging']['total_items']
      @per_page         = json['paging']['items_per_page']
      @pages            = json['paging']['number_of_pages']
      @current_page     = json['paging']['current_page']
      @prev_page_url    = json['paging']['prev_page_url']
      @next_page_url    = json['paging']['next_page_url']
      @sort_order       = json['paging']['sort_order']

      populate_results(json, _model)
    end


    def populate_results(json, _model)
      @results = json["items"].map{|r| _model.new(r)}
    end

  end
end
