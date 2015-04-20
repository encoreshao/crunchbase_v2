# encoding: utf-8

module Crunchbase
  class CBEntity

    RELATIONSHIPS = %w[ Crunchbase::Ipo Crunchbase::Product Crunchbase::SubOrganization  Crunchbase::FundingRound Crunchbase::Founder Crunchbase::Customer Crunchbase::Competitor Crunchbase::Acquisition Crunchbase::Degree Crunchbase::PrimaryAffiliation Crunchbase::Experience, Crunchbase::FoundedCompany Crunchbase::Video Crunchbase::PrimaryLocation Crunchbase::AdvisorAt Crunchbase::OrganizationInvestor ]
    
    # Factory method to return an instance from a permalink  
    def self.get(permalink)
      return self.new( API.single_entity(permalink, self::RESOURCE_NAME) )
    end

    # Finds an entity by its name. Uses two HTTP requests; one to find the
    # permalink, and another to request the actual entity.
    def self.search(options)
      return [] unless self == Crunchbase::Organization

      return Search.new options, API.search( options, self::RESOURCE_LIST ), SearchResult
    end
    
    def self.lists_for_permalink(permalink, options={})
      options[:model_name] = (RELATIONSHIPS.include?(self.name) ? Relationship : self)
      
      return API.lists_for_permalink(permalink, self::RESOURCE_LIST, options)
    end

    def self.lists_for_person_permalink(permalink, options={})
      options[:model_name] = (RELATIONSHIPS.include?(self.name) ? Relationship : self)
      
      return API.lists_for_person_permalink(permalink, self::RESOURCE_LIST, options)
    end

    def self.category_lists_by_permalink(permalink, classify_name, options={})
      options[:model_name]  = (RELATIONSHIPS.include?(self.name) ? Relationship : self)

      return API.lists_for_category(classify_name, permalink, self::RESOURCE_LIST, options)
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
      return [] if list.nil?

      list['items'].map do |l|
        self.new l if l.kind_of?(Hash)
      end.compact
    end

    def self.parsing_from_list(list)
      return [] if list.nil?
      
      list.map do |l|
        self.new l if l.kind_of?(Hash)
      end.compact
    end

    def self.total_items_from_list(list)
      return 0 if list.nil?
      
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
      when 'Degree' then [Crunchbase::Degree, 'degree']
      when 'Experience' then [Crunchbase::Experience, 'experience']
      when 'PrimaryAffiliation' then [Crunchbase::PrimaryAffiliation, 'primary_affiliation']
      when 'Video' then [Crunchbase::Video, 'video']
      when 'FoundedCompany' then [Crunchbase::FoundedCompany, 'founded_company']
      when 'AdvisorAt' then [Crunchbase::AdvisorAt, 'advisor_at']
      when 'PrimaryLocation' then [Crunchbase::PrimaryLocation, 'primary_location']
      else
        []
      end
    end

  end
end
