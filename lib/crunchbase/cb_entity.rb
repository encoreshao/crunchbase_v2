# encoding: utf-8

module Crunchbase
  class CBEntity

    RELATIONSHIPS = %w[ Crunchbase::Ipo Crunchbase::Product Crunchbase::SubOrganization  Crunchbase::FundingRound Crunchbase::Founder Crunchbase::Customer Crunchbase::Competitor Crunchbase::Acquisition ]
    
    # Factory method to return an instance from a permalink  
    def self.get(permalink)
      return self.new( API.single_entity(permalink, self::RESOURCE_NAME) )
    end

    # Finds an entity by its name. Uses two HTTP requests; one to find the
    # permalink, and another to request the actual entity.
    # http://api.crunchbase.com/v/2/organizations?name=ekohe&organization_types=company&user_key=key&page=1"
    def self.search(options)
      API.search( options, self::RESOURCE_LIST )
    end
    
    def self.lists_for_permalink(permalink, options={})
      options[:model_name] = (RELATIONSHIPS.include?(self.name) ? Relationship : self)
      
      API.lists_for_permalink(permalink, self::RESOURCE_LIST, options)
    end

    def self.list(page=nil, order=nil)
      options[:page], options[:order] = page, order

      API.search(options, self::RESOURCE_LIST)
    end

    def self.array_from_list(list)
      list['items'].map do |l|
        self.new l
      end
    end

    def self.total_items_from_list(list)
      list['paging']['total_items']
    end

  end
end
