# encoding: utf-8

module Crunchbase
  class OrganizationInvestor < CBEntity
    
    attr_reader :name, :type_name, :path, :permalink, :first_name, :last_name, :type

    def initialize(hash)
      @type_name    = hash["type"]
      if hash["type"] == 'Organization'
        @type         = Organization
        @name         = hash["name"]
      else
        @type         = Person
        @name         = [hash["first_name"], hash["last_name"]].compact.join(' ')
        @first_name   = hash["first_name"]
        @last_name    = hash["last_name"]
      end
      @path         = hash["path"]
      @permalink    = hash["path"] && hash["path"].split('/').last
    end
    
  end
end
