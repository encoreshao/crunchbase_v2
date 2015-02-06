# encoding: utf-8

# https://api.crunchbase.com/v/2/person/#{permalink}/advisor_at

module Crunchbase
  class AdvisorAt < CBEntity
    
    RESOURCE_LIST = 'advisor_at'

    attr_reader :organization_name, :title

    def initialize(json)
      @organization_name      = json['organization_name']
      @title                  = json['title']
    end

  end
end