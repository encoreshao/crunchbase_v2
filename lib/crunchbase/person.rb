# encoding: utf-8

# https://api.crunchbase.com/v/2/person/#{permalink}?user_key=#{user_key}

module Crunchbase
  class Person < CBEntity
    
    RESOURCE_LIST = 'people'
    RESOURCE_NAME = 'person'
    
    attr_reader :type_name, :name, :first_name, :last_name, :permalink, :bio, :born_on, :died_on, 
                :is_deceased, :created_at, :updated_at, :homepage_url, :uuid

    attr_reader :degrees, :experiences, :primary_locations, :primary_affiliations, :primary_images, :websites, 
                :founded_companies, :investments, :advisor_ats, :videos, :new_items

    attr_reader :degrees_total_items, :experiences_total_items, :primary_locations_total_items,  
                :primary_affiliations_total_items, :primary_images_total_items, :websites_total_items,
                :investments_total_items, :founded_companies_total_items, 
                :advisor_ats_total_items, :videos_total_items, :new_items_total_items
                

    def initialize(json)
      @uuid           = json['uuid']
      @type_name      = json['type']
      properties      = json['properties']
      relationships   = json['relationships']

      @name           = properties['first_name'].to_s + ' ' + properties['last_name'].to_s
      @first_name     = properties['first_name']
      @last_name      = properties['last_name']
      @permalink      = properties['permalink']
      @bio            = properties['bio']
      @born_on        = properties['born_on'] && DateTime.parse(properties['born_on'])
      @died_on        = properties['died_on'] && DateTime.parse(properties['died_on'])
      @is_deceased    = properties['is_deceased']
      @homepage_url   = properties['homepage_url']
      @created_at     = Time.at(properties['created_at']).utc
      @updated_at     = Time.at(properties['updated_at']).utc

      @degrees_list               = relationships['degrees']
      @experiences_list           = relationships['experience']
      @primary_locations_list     = relationships['primary_location']
      @affiliations_list          = relationships['primary_affiliation']
      @investments_list           = relationships['investments']
      @advisor_ats_list           = relationships['advisor_at']
      @founded_companies_list     = relationships['founded_companies']
      @primary_images_list        = relationships['primary_image']
      @videos_list                = relationships['videos']
      @websites_list              = relationships['websites']
      @new_items_list             = relationships['news']
    end

    def degrees
      @degrees ||= Degree.array_from_list(@degrees_list)
    end

    def experiences
      @experiences ||= Experience.array_from_list(@experiences_list)
    end

    def primary_locations
      @primary_locations ||= PrimaryLocation.array_from_list(@primary_locations_list)
    end

    def primary_affiliations
      @primary_affiliations ||= PrimaryAffiliation.array_from_list(@affiliations_list)
    end

    def investments
      @investments ||= Investment.array_from_list(@investments_list)
    end

    def advisor_ats
      @advisor_ats ||= AdvisorAt.array_from_list(@advisor_ats_list)
    end

    def founded_companies
      @founded_companies ||= FoundedCompany.array_from_list(@founded_companies_list)
    end

    def primary_images
      @primary_images ||= PrimaryImage.array_from_list(@primary_images_list)
    end

    def videos
      @videos ||= Video.array_from_list(@videos_list)
    end

    def websites
      @websites ||= Website.array_from_list(@websites_list)
    end

    def new_items
      @new_items ||= ItemNew.array_from_list(@new_items_list)
    end

    # TODO
    # Get all relationships total count

    def degrees_total_items
      @degrees_total_items ||= Degree.total_items_from_list(@degrees_list)
    end

    def experiences_total_items
      @experiences_total_items ||= Experience.total_items_from_list(@experiences_list)
    end

    def primary_locations_total_items
      @primary_locations_total_items ||= PrimaryLocation.total_items_from_list(@primary_locations_list)
    end

    def primary_affiliations_total_items
      @primary_affiliations_total_items ||= PrimaryAffiliation.total_items_from_list(@affiliations_list)
    end

    def investments_total_itmes
      @investments_total_itmes ||= Investment.total_items_from_list(@investments_list)
    end

    def advisor_ats_total_itmes
      @advisor_ats_total_itmes ||= AdvisorAt.total_items_from_list(@advisor_ats_list)
    end

    def founded_companies_total_items
      @founded_companies_total_items ||= FoundedCompany.total_items_from_list(@founded_companies_list)
    end

    def primary_images_total_items
      @primary_images_total_items ||= PrimaryImage.total_items_from_list(@primary_images_list)
    end

    def videos_total_items
      @videos_total_items ||= Video.total_items_from_list(@videos_list)
    end

    def websites_total_items
      @websites_total_items ||= Website.total_items_from_list(@websites_list)
    end

    def new_items_total_items
      @new_items_total_items ||= ItemNew.total_items_from_list(@new_items_list)
    end

  end
end