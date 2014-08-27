require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")
require 'net/http'

module Crunchbase
  describe Search do
    
    it "should retrieve search results" do
      s = Search.search('google')
      puts s.total_items
      puts s.per_page
      puts s.pages
      puts s.current_page
      s.results.each { |result| puts result.name }
    end

  end
end
