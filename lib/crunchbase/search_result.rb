# encoding: utf-8

module Crunchbase
  class SearchResult

    attr_reader :total_items, :items_per_page, :number_of_pages, :current_page, 
                :prev_page_url, :next_page_url, :sort_order, :items

    def initialize(json, _type)
      @total_items      = json['paging']['total_items']
      @items_per_page   = json['paging']['items_per_page']
      @number_of_pages  = json['paging']['number_of_pages']
      @current_page     = json['paging']['current_page']
      @prev_page_url    = json['paging']['prev_page_url']
      @next_page_url    = json['paging']['next_page_url']
      @sort_order       = json['paging']['sort_order']
      @items            = json['items'].map {|i| _type.new i }
    end

  end
end