# encoding: utf-8
require 'date'

module Crunchbase
  class Organization < CBEntity
    
    RESOURCE_NAME = 'organization'
    RESOURCE_LIST = 'organizations'

    attr_reader :type_name, :name, :permalink, :description, :short_description, 
                :homepage_url, :founded_on, :is_closed, :closed_on, 
                :primary_role, :total_funding_usd, :number_of_investments, 
                :number_of_employees, :stock_symbol, :stock_exchange, 
                :created_at, :updated_at, :logo_url

    attr_reader :past_teams, :sub_organizations, :current_teams, :acquisitions, :competitors, 
                :offices, :headquarters, :funding_rounds, :categories, :customers, :investments, 
                :founders, :ipos, :products, :primary_images, :images, :websites, :new_items, 
                :board_members_and_advisors

    attr_reader :past_teams_total_items, :sub_organizations_total_items, :current_teams_total_items, 
                :acquisitions_total_items, :competitors_total_items, :offices_total_items, 
                :headquarters_total_items, :funding_rounds_total_items, :categories_total_items, 
                :customers_total_items, :investments_total_items, :founders_total_items, 
                :ipos_total_items, :products_total_items, :primary_images_total_items, 
                :images_total_items, :websites_total_items, :new_items_total_items, 
                :board_members_and_advisors_total_items


    def initialize(json)
      @type_name              = json['type']
      properties              = json['properties']
      relationships           = json['relationships']

      @name                   = properties['name']
      @permalink              = properties['permalink']
      @description            = properties['description']
      @short_description      = properties['short_description']
      @homepage_url           = properties['homepage_url']
      @founded_on             = properties['founded_on'] && DateTime.parse(properties['founded_on'])
      @is_closed              = properties['is_closed']
      @closed_on              = properties['closed_on'] && DateTime.parse(properties['closed_on'])
      @primary_role           = properties['primary_role']
      @total_funding_usd      = properties['total_funding_usd']
      @number_of_investments  = properties['number_of_investments']
      @number_of_employees    = properties['number_of_employees']
      @stock_symbol           = properties['stock_symbol']
      @stock_exchange         = properties['stock_exchange']
      @created_at             = Time.at(properties['created_at']).utc
      @updated_at             = Time.at(properties['updated_at']).utc

      @past_teams_list        = relationships['past_team']
      @sub_organizations_list = relationships['sub_organizations']
      @current_teams_list     = relationships['current_team']
      @acquisitions_list      = relationships['acquisitions']
      @competitors_list       = relationships['competitors']
      @offices_list           = relationships['offices']
      @headquarters_list      = relationships['headquarters']
      @funding_rounds_list    = relationships['funding_rounds']
      @categories_list        = relationships['categories']
      @customers_list         = relationships['customers']
      @investments_list       = relationships['investments']
      @founders_list          = relationships['founders']
      @ipos_list              = relationships['ipo']
      @products_list          = relationships['products']
      @primary_images_list    = relationships['primary_image']
      @images_list            = relationships['images']
      @websites_list          = relationships['websites']
      @new_items_list         = relationships['news']
      @board_members_and_advisors_list  = relationships['board_members_and_advisors']
    end

    # ================================================================
    # Relationship objects
    # %w[ competitors customers founders funding_rounds ipos products sub_organizations ]

    # Organization
    def competitors
      @competitors ||= Relationship.array_from_list(@competitors_list)
    end

    # Organization
    def customers
      @customers ||= Relationship.array_from_list(@customers_list)
    end

    # Person
    def founders
      @founders ||= Relationship.array_from_list(@founders_list)
    end

    # FundingRound
    def funding_rounds
      @funding_rounds ||= Relationship.array_from_list(@funding_rounds_list)
    end

    # Ipo
    def ipos
      @ipos ||= Relationship.array_from_list(@ipos_list)
    end

    # Acquisition
    def acquisitions
      @acquisitions ||= Relationship.array_from_list(@acquisitions_list)
    end

    # Product
    def products
      @products ||= Relationship.array_from_list(@products_list)
    end

    # Organization
    def sub_organizations
      @sub_organizations ||= Relationship.array_from_list(@sub_organizations_list)
    end

    # Get organization other relationship objects
    def past_teams
      @past_teams ||= PastTeam.array_from_list(@past_teams_list)
    end

    def current_teams
      @current_teams ||= CurrentTeam.array_from_list(@current_teams_list)
    end

    def offices
      @offices ||= Office.array_from_list(@offices_list)
    end

    def headquarters
      @headquarters ||= Headquarter.array_from_list(@headquarters_list)
    end

    def categories
      @categories ||= Category.array_from_list(@categories_list)
    end

    def investments
      @investments ||= Investment.array_from_list(@investments_list)
    end

    def primary_images
      @primary_images ||= PrimaryImage.array_from_list(@primary_images_list)
    end

    # Setting current company logo
    def logo_url
      @logo_url ||= (primary_images ? (primary_images.first && primary_images.first.path) : nil)
    end

    def images
      @images ||= Image.array_from_list(@images_list)
    end

    def websites
      @websites ||= Website.array_from_list(@websites_list)
    end

    def new_items
      @new_items ||= NewItem.array_from_list(@new_items_list)
    end

    def board_members_and_advisors
      @board_members_and_advisors ||= BoardMembersAndAdvisor.array_from_list(@board_members_and_advisors_list)
    end

    # Get all relationship total_items_count
    def past_teams_total_items
      @past_teams_total_items ||= PastTeam.total_items_from_list(@past_teams_list)
    end

    def sub_organizations_total_items
      @sub_organizations_total_items ||= SubOrganization.total_items_from_list(@sub_organizations_list)
    end

    def current_teams_total_items
      @current_teams_total_items ||= CurrentTeam.total_items_from_list(@current_teams_list)
    end

    def acquisitions_total_items
      @acquisitions_total_items ||= Acquisition.total_items_from_list(@acquisitions_list)
    end

    def competitors_total_items
      @competitors_total_items ||= Competitor.total_items_from_list(@competitors_list)
    end

    def offices_total_items
      @offices_total_items ||= Office.total_items_from_list(@offices_list)
    end

    def headquarters_total_items
      @headquarters_total_items ||= Headquarter.total_items_from_list(@headquarters_list)
    end

    def funding_rounds_total_items
      @funding_rounds_total_items ||= FundingRound.total_items_from_list(@funding_rounds_list)
    end

    def categories_total_items
      @categories_total_items ||= Category.total_items_from_list(@categories_list)
    end

    def customers_total_items
      @customers_total_items ||= Customer.total_items_from_list(@customers_list)
    end

    def investments_total_items
      @investments_total_items ||= Investment.total_items_from_list(@investments_list)
    end

    def founders_total_items
      @founders_total_items ||= Founder.total_items_from_list(@founders_list)
    end

    def ipos_total_items
      @ipos_total_items ||= Ipo.total_items_from_list(@ipos_list)
    end

    def products_total_items
      @products_total_items ||= Product.total_items_from_list(@products_list)
    end

    def primary_images_total_items
      @primary_images_total_items ||= PrimaryImage.total_items_from_list(@primary_images_list)
    end

    def images_total_items
      @images_total_items ||= Image.total_items_from_list(@images_list)
    end

    def websites_total_items
      @websites_total_items ||= Website.total_items_from_list(@websites_list)
    end

    def new_items_total_items
      @new_items_total_items ||= NewItem.total_items_from_list(@new_items_list)
    end

    def board_members_and_advisors_total_items
      @board_members_and_advisors_total_items ||= BoardMembersAndAdvisor.total_items_from_list(@board_members_and_advisors_list)
    end

  end

end