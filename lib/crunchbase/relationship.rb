# encoding: utf-8

module Crunchbase
  class Relationship < CBEntity
    attr_reader :name, :type_name, :path, :permalink, :created_at, :updated_at

    def initialize(hash)
      @type_name    = hash["type"]
      @name         = hash["name"]
      @path         = hash["path"]
      @permalink    = hash["path"].split('/').last
      @created_at   = Time.at(hash['created_at']).utc
      @updated_at   = Time.at(hash['updated_at']).utc
    end

    # Takes a relationship list (directly from the JSON hash) and returns an
    # array of instances of Relationship subclasses.
    # def self.array_from_list(list)
    #   list.map do |l|
    #     case type_name
    #     when "competitors"
    #       CompetitorRelationship.new(l)
    #     when "customers"
    #       CustomerRelationship.new(l)
    #     when "founders"
    #       FounderRelationship.new(l)
    #     when "funding_rounds"
    #       FundingRoundRelationship.new(l)
    #     when "ipo"
    #       IpoRelationship.new(l)
    #     when "products"
    #       ProductRelationship.new(l)
    #     when "sub_organizations"
    #       SubOrganizationsRelationship.new(l)
    #     else
    #       # "Relationship type not recognized"
    #       # TODO: Figure out how to log this
    #       next
    #     end
    #   end
    # end
  end
end
