# encoding: utf-8

# http://api.crunchbase.com/v/2/organization/facebook/funding_rounds


module Crunchbase
  class FundingRound < CBEntity
    RESOURCE_NAME = 'funding-round'
    RESOURCE_LIST = 'funding_rounds'

    attr_reader :type_name, :name, :post_money_valuation_currency_code, :permalink, :funding_type, 
                :money_raised_usd, :announced_on_trust_code, :money_raised, 
                :money_raised_currency_code, :announced_on, :canonical_currency_code,
                :created_at, :updated_at

    attr_reader :investments, :funded_organizations, :new_items

    attr_reader :investments_total_items, :funded_organizations_total_items, :new_items_total_items

    def initialize(json)
      @type_name      = json['type']
      properties      = json['properties']
      relationships   = json['relationships']

      @name           = properties['name']
      @funding_type   = properties['funding_type']
      @permalink      = properties['permalink']
      @money_raised_usd   = properties['money_raised_usd']
      @announced_on       = properties['announced_on'] && DateTime.parse(properties['announced_on'])
      @announced_on_trust_code    = properties['announced_on_trust_code']
      @canonical_currency_code    = properties['canonical_currency_code']
      @money_raised               = properties['money_raised']
      @created_at                 = Time.at(properties['created_at']).utc
      @updated_at                 = Time.at(properties['updated_at']).utc
      @money_raised_currency_code           = properties['money_raised_currency_code']
      @post_money_valuation_currency_code   = properties['post_money_valuation_currency_code']

      @investments_list           = relationships['investments']
      @funded_organizations_list  = relationships['funded_organization']
      @new_items_list             = relationships['news']
    end


    def investments
      @investments ||= Investment.array_from_list(@investments_list)
    end

    def funded_organizations
      @funded_organizations ||= Relationship.array_from_list(@funded_organizations_list)
    end

    def new_items
      @new_items ||= NewItem.array_from_list(@new_items_list)
    end

    def investments_total_items
      @investments_total_items ||= Investment.total_items_from_list(@investments_list)
    end

    def funded_organizations_total_items
      @funded_organizations_total_items ||= Relationship.total_items_from_list(@funded_organizations_list)
    end

    def new_items_total_items
      @new_items_total_items ||= NewItem.total_items_from_list(@new_items_list)
    end

  end

end