require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")
require 'json'

module Crunchbase
  describe Person do
    describe "advanced indexing" do
      before(:all) do
        @all_person = Person.list
      end

      it "should pull from web api" do
        @all_person.per_page.should == 1000
        @all_person.current_page.should == 1
        puts @all_person.results[0..10].inspect
      end
    end

    # it "should pull from web api" do
    #   person = Crunchbase::Person.get('eduardo-saverin')
    #   person.permalink.should == 'eduardo-saverin'
    # end
  end
end
