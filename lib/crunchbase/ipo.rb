# encoding: utf-8

# "data": {
# "properties": {
#  "went_public_on": "2012-05-16",
#  "went_public_on_trust_code": 7,
#  "canonical_currency_code": "USD",
#  "money_raised_currency_code": "USD",
#  "opening_valuation_currency_code": "USD",
#  "stock_symbol": "FB",
#  "permalink": "a3bc391490d52ba8529d1cfc20550a87",
#  "name": "Went public on May 16, 2012",
#  "opening_valuation_usd": 104000000000,
#  "opening_share_price_usd": "38.0",
#  "stock_exchange_symbol": "NASDAQ",
#  "shares_outstanding": null,
#  "shares_sold": 421000000,
#  "opening_share_price_currency_code": "USD",
#  "opening_share_price": "38.0",
#  "money_raised_usd": 16000000000,
#  "opening_valuation": 104000000000,
#  "money_raised": 16000000000,
#  "created_at": 1407165772,
#  "updated_at": 1407183294
# }


module Crunchbase
  class Ipo < CBEntity
    RESOURCE_NAME = 'ipo'
    RESOURCE_LIST = 'ipo'

    attr_reader :type_name, :went_public_on, :went_public_on_trust_code, :canonical_currency_code, 
                :money_raised_currency_code, :opening_valuation_currency_code, :stock_symbol, 
                :permalink, :name, :opening_valuation_usd, :opening_share_price_usd,
                :stock_exchange_symbol, :shares_outstanding, :shares_sold, 
                :opening_share_price_currency_code, :opening_share_price, :money_raised_usd, 
                :opening_valuation, :money_raised, :created_at, :updated_at

    attr_reader :funded_companies
    attr_reader :funded_companies_total_items


    def initialize(json)
      properties            = json['properties']
      relationships         = json['relationships']

      @type_name            = properties['type']
      @name                 = properties['name']
      @went_public_on       = properties['went_public_on']
      @stock_symbol         = properties['stock_symbol']
      @permalink            = properties['permalink']
      @shares_outstanding   = properties['shares_outstanding']
      @shares_sold          = properties['shares_sold']
      @opening_share_price  = properties['opening_share_price']
      @money_raised_usd     = properties['money_raised_usd']
      @opening_valuation    = properties['opening_valuation']
      @money_raised         = properties['money_raised']
      @created_at           = Time.at(properties['created_at']).utc
      @updated_at           = Time.at(properties['updated_at']).utc
      @went_public_on_trust_code  = properties['went_public_on_trust_code']
      @canonical_currency_code    = properties['canonical_currency_code']
      @money_raised_currency_code = properties['money_raised_currency_code']
      @opening_valuation_usd      = properties['opening_valuation_usd']
      @opening_share_price_usd    = properties['opening_share_price_usd']
      @stock_exchange_symbol      = properties['stock_exchange_symbol']
      @opening_valuation_currency_code    = properties['opening_valuation_currency_code']
      @opening_share_price_currency_code  = properties['opening_share_price_currency_code']

      @funded_companies_list      = relationships['funded_company']
    end

    def funded_companies
      @funded_companies ||= Relationship.array_from_list(@funded_companies_list)
    end

    def funded_companies_total_items
      @funded_companies_total_items ||= Relationship.array_from_list(@funded_companies_list)
    end

  end
end