require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")
require 'net/http'

module Crunchbase
  describe SearchResult do
    
    before(:all) do
      @result = Search.find('google').results[0]
    end
    
    it "should return the entity which is named" do
      @result.name.should == 'Google'
    end

  end
end
