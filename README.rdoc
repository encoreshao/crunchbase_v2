= Crunchbase API

Ruby API wrapper for [Crunchbase API](https://developer.crunchbase.com/docs) version 2.

== Installation

Add this line to your application's Gemfile:

    gem 'crunchbase', github: 'encoreshao/crunchbase_v2'

And then execute:

    $ bundle

== Usage Examples

Config your user_key, debug somewhere like development.rb.

Crunchbase::API.key   = 'YOUR_API_KEY'
Crunchbase::API.debug = false

=== Search

Searching the Crunchbase is possible with the Search class.

   s = Crunchbase::Search.search("facebook")
   s.total_items
   s.per_page
   s.pages
   s.current_page
   s.results.each { |result| puts result.name }
  
The Search will return a list consisting of objects of the SearchResult type.

   all_results = s.results


=== Organizations && RelationShip List Items

Get information by the permalink, Example:

    company = Crunchbase::Organization.get("facebook")
    Relationship objects 
    [ competitors customers founders funding_rounds ipos products sub_organizations ]
    Friendly relationship objects
    [ past_teams current_teams acquisitions offices headquarters categories investments primary_images images websites new_items board_members_and_advisors ]
    company.competitors               Only return Top 8 items
    company.competitors_total_items   Return competitors total items count
    company.competitors.each do |e|
      competitor = a.fetch
      puts competitor.inspect
    end
    OR
    company.websites

If you want all competitors items, Please do: 

    all_competitors = Competitor.lists_for_permalink(company.permalink)
    all_competitors.per_page
    all_competitors.current_page
    all_competitors.size
    all_competitors.results           Return all competitors items

=== People
    
person = Crunchbase::Person.get( permalink )

#<Crunchbase::Person:0x007fc95bca3880 @type_name="Person" ..... > 

people = Crunchbase::Person.list( page )

people.results.inspect
[ 
  #<Crunchbase::SearchResult:0x007fd16ae18b40 ...>, 
  #<Crunchbase::SearchResult:0x007fd16ae18870 ...>, 
  #<Crunchbase::SearchResult:0x007fd16ae185a0 ...>, 
  #<Crunchbase::SearchResult:0x007fd16ae182f8 ...>
  ......
]

=== How to use Location & Category .... Very simple [ such as a Person ]
    
== Contributing

Contributions are welcome. Note that in order to run the test suite, you need to
include an API key in +spec/apikey.yml+. This file is ignored by git. An example
file is provided for convenience.

== Copyright

Copyright © 2014-08 Encore Shao. See LICENSE for details.
