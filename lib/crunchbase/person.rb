# encoding: utf-8

# curl -v  -X GET "http://api.crunchbase.com/v/2/person/randi-zuckerberg?user_key=21062a0a83fec3591daa3796ce83d93e"
# {
#  "metadata": {
#   "version": 2,
#   "www_path_prefix": "http://www.crunchbase.com/",
#   "api_path_prefix": "http://api.crunchbase.com/v/2/",
#   "image_path_prefix": "http://images.crunchbase.com/"
#  },
#  "data": {
#   "uuid": "84ab8d0bd16ea4180ecf53fb7f0d8127",
#   "type": "Person",
#   "properties": {
#    "role_investor": true,
#    "last_name": "Zuckerberg",
#    "first_name": "Randi",
#    "permalink": "randi-zuckerberg",
#    "bio": "Randi Zuckerberg managed marketing initiatives at [Facebook](/company/facebook), where she led the company's US election and international politics strategy, as well as pioneered several large media partnerships. \r\n\r\nIncluded in The Hollywood Reporter's 2008 Digital Power List, Randi has led projects ranging from the ABC News/Facebook Presidential Debates to the CNN/Facebook Inauguration Day Partnership and Comcast's Facebook Diaries. \r\n\r\nRandi is a graduate of Harvard University and has a passion for Italian opera and Broadway showtunes.  She is also the sister of Facebook co-founder [Mark Zuckerberg.](/person/mark-zuckerberg)",
#    "born_on_day": 30,
#    "born_on_month": 1,
#    "born_on_year": 1981,
#    "born_on": "1981-01-30",
#    "born_on_trust_code": 7,
#    "created_at": 1233271545,
#    "updated_at": 1408498780
#   }
#  }
# }

module Crunchbase
  class Person < CBEntity
    RESOURCE_NAME = 'person'
    RESOURCE_LIST = 'people'
    
    attr_reader :type_name, :first_name, :last_name, :permalink, :bio, :born_on, :died_on, 
                :is_deceased, :created_at, :updated_at

    def initialize(json)
      @type_name      = json['type']
      @first_name     = json['first_name']
      @last_name      = json['last_name']
      @permalink      = (json['permalink'] || json['path'].gsub('person/', ''))
      @bio            = json['bio']
      @born_on        = json['born_on'] && DateTime.parse(json['born_on'])
      @died_on        = json['died_on'] && DateTime.parse(json['died_on'])
      @is_deceased    = json['is_deceased']
      @created_at     = Time.at(json['created_at']).utc
      @updated_at     = Time.at(json['updated_at']).utc
    end

  end

end