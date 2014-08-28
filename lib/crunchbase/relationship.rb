# encoding: utf-8

require 'date'

module Crunchbase
  class Relationship < CBEntity
    attr_reader :name, :type_name, :path, :permalink, :created_at, :updated_at, :announced_on

    def initialize(hash)
      @type_name    = hash["type"]
      @announced_on = hash["announced_on"] && DateTime.parse(hash["announced_on"])
      @name         = hash["name"]
      @path         = hash["path"]
      @permalink    = hash["path"].split('/').last
      @created_at   = hash['created_at'] && Time.at(hash['created_at']).utc
      @updated_at   = hash['updated_at'] && Time.at(hash['updated_at']).utc
    end
    
  end
end
