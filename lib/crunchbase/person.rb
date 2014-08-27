# encoding: utf-8

# http://api.crunchbase.com/v/2/person/randi-zuckerberg?user_key=key"

module Crunchbase
  class Person < CBEntity
    RESOURCE_NAME = 'person'
    RESOURCE_LIST = 'people'
    
    attr_reader :type_name, :name, :first_name, :last_name, :permalink, :bio, :born_on, :died_on, 
                :is_deceased, :created_at, :updated_at

    def initialize(json)
      @type_name      = json['type']
      properties      = json['properties']

      @name           = properties['first_name'] + ' ' + properties['last_name']
      @first_name     = properties['first_name']
      @last_name      = properties['last_name']
      @permalink      = properties['permalink']
      @bio            = properties['bio']
      @born_on        = properties['born_on'] && DateTime.parse(properties['born_on'])
      @died_on        = properties['died_on'] && DateTime.parse(properties['died_on'])
      @is_deceased    = properties['is_deceased']
      @created_at     = Time.at(properties['created_at']).utc
      @updated_at     = Time.at(properties['updated_at']).utc
    end

  end

end