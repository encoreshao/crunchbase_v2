require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")
require 'json'

module Crunchbase
  describe Person, :vcr  do
    subject { Person.list }

    it_has_behavior 'pagination'

    # it "should pull from web api" do
    #   person = Crunchbase::Person.get('eduardo-saverin')
    #   person.permalink.should == 'eduardo-saverin'
    # end
  end
end
