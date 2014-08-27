# encoding: utf-8

module Crunchbase
  class Relationship < CBEntity
    attr_reader :name, :type_name, :path, :permalink, :created_at, :updated_at

    def initialize(hash)
      @type_name    = hash["type"]
      @name         = hash["name"]
      @path         = hash["path"]
      @permalink    = hash["path"].split('/').last
      @created_at   = hash['created_at'] && Time.at(hash['created_at']).utc
      @updated_at   = hash['updated_at'] && Time.at(hash['updated_at']).utc
    end
    
  end
end
