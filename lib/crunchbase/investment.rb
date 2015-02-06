# encoding: utf-8

# https://api.crunchbase.com/v/2/organization/facebook/investments

module Crunchbase
  class Investment < CBEntity
    
    RESOURCE_LIST = 'investments'

    attr_reader :type_name, :money_invested, :money_invested_currency_code, 
                :money_invested_usd, :funding_round_path, :invested_in_type,
                :invested_in_name, :invested_in_path

    def initialize(json)
      @type_name      = json['type']
      @money_invested = json['money_invested']
      @money_invested_currency_code  = json['money_invested_currency_code']
      @money_invested_usd   = json['money_invested_usd']
      @funding_round_path   = json['funding_round'] && json['funding_round']['path']

      if json['invested_in_type']
        @invested_in_type   = json['invested_in_type'] && json['invested_in_type']['type']
        @invested_in_name   = json['invested_in_type'] && json['invested_in_type']['name']
        @invested_in_path   = json['invested_in_type'] && json['invested_in_type']['path']
      elsif json['invested_in']
        # From one's organization investments
        @invested_in_type   = json['invested_in'] && json['invested_in']['type']
        @invested_in_name   = json['invested_in'] && json['invested_in']['name']
        @invested_in_path   = json['invested_in'] && json['invested_in']['path']
      elsif json['investor']
        @invested_in_type   = json['investor'] && json['investor']['type']
        @invested_in_name   = json['investor'] && json['investor']['name']
        @invested_in_path   = json['investor'] && json['investor']['path']
      end
    end

  end
end