# encoding: utf-8

# http://api.crunchbase.com/v/2/organization/facebook/acquisitions

module Crunchbase
  class Acquisition < CBEntity
    RESOURCE_NAME = 'acquisition'
    RESOURCE_LIST = 'acquisitions'

    attr_reader :announced_on, :announced_on_trust_code, :price_currency_code, 
                :permalink, :name, :payment_type, :price, :disposition_of_acquired, 
                :acquisition_type, :acquisition_status, :price_usd, :created_at, :updated_at

    attr_reader :acquirers, :acquirees, :new_items

    attr_reader :acquirers_total_items, :acquirees_total_items, :new_items_total_items

    def initialize(json)
      @type_name              = json['type']
      properties              = json['properties']
      relationships           = json['relationships']

      @announced_on             = properties['announced_on'] && DateTime.parse(properties['announced_on'])
      @announced_on_trust_code  = properties['announced_on_trust_code']
      @price_currency_code      = properties['price_currency_code']
      @permalink                = properties['permalink']
      @name                     = properties['name']
      @payment_type             = properties['payment_type']
      @price                    = properties['price']
      @disposition_of_acquired  = properties['disposition_of_acquired']
      @acquisition_type         = properties['acquisition_type']
      @acquisition_status       = properties['acquisition_status']
      @price_usd                = properties['price_usd']
      @created_at               = Time.at(properties['created_at']).utc
      @updated_at               = Time.at(properties['updated_at']).utc

      @acquirers_list           = relationships['acquirer']
      @acquirees_list           = relationships['acquiree']
      @new_items_list           = relationships['news']
    end

    def acquirers
      @acquirers ||= Relationship.array_from_list(@acquirers_list)
    end

    def acquirees
      @acquirees ||= Relationship.array_from_list(@acquirees_list)
    end

    def new_items
      @new_items ||= NewItem.array_from_list(@new_items_list)
    end

    def acquirers_total_items
      @acquirers_total_items ||= Relationship.total_items_from_list(@acquirers_list)
    end

    def acquirees_total_items
      @acquirees_total_items ||= Relationship.total_items_from_list(@acquirees_list)
    end

    def new_items_total_items
      @new_items_total_items ||= NewItem.total_items_from_list(@new_items_list)
    end
  end

end