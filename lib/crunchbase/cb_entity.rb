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
      return [] unless self == Crunchbase::Organization

      return Search.new options, API.search( options, self::RESOURCE_LIST )
    end
    
    def self.lists_for_permalink(permalink, options={})
      options[:model_name] = (RELATIONSHIPS.include?(self.name) ? Relationship : self)
      
      return API.lists_for_permalink(permalink, self::RESOURCE_LIST, options)
    end

    def fetch
      fetch_object = get_fetch_object
      return [] if fetch_object.empty?

      return fetch_object[0].new API.fetch(self.permalink, fetch_object[1])
    end

    def self.list(page=nil)
      options = { page: page, model_name: self }

      return API.list( options, self::RESOURCE_LIST )
    end

    def self.array_from_list(list)
      list['items'].map do |l|
        self.new l
      end
    end

    def self.total_items_from_list(list)
      list['paging']['total_items']
    end

    private
    def get_fetch_object
      case self.type_name
      when 'Organization' then [Crunchbase::Organization, 'organization']
      when 'Ipo' then [Crunchbase::Ipo, 'ipo']
      when 'Person' then [Crunchbase::Person, 'person']
      when 'Product' then [Crunchbase::Product, 'product']
      when 'SubOrganization' then [Crunchbase::SubOrganization, 'organization']
      when 'FundingRound' then [Crunchbase::FundingRound, 'funding-round']
      when 'Founder' then [Crunchbase::Founder, 'organization']
      when 'Customer' then [Crunchbase::Customer, 'organization']
      when 'Competitor' then [Crunchbase::Competitor, 'organization']
      when 'Acquisition' then [Crunchbase::Acquisition, 'acquisition']
      else
        []
      end
    end

  end
end
