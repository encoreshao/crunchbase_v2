require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")
require 'json'

module Crunchbase
  describe Person do
    
    # before(:all) do
    #   @randi = File.open(File.join(File.dirname(__FILE__), "..", "fixtures", "person-randi-zuckerberg.js"))
    # end
    
    # before(:each) do
    #   @randi.rewind
    # end 
    
    # it "should ask for JSON object" do
    #   API.should_receive(:single_entity).with("randi-zuckerberg", "person").and_return(JSON.parse(@randi.read))
    #   person = Person.get("randi-zuckerberg")
    # end
    
    # it "should get information from supplied file" do
    #   API.should_receive(:single_entity).with("randi-zuckerberg", "person").and_return(JSON.parse(@brad.read))
    #   person = Person.get("randi-zuckerberg")
    #   person.first_name.should == "Randi"
    # end
    
    # it "should return a date for born" do
    #   person = Person.new(JSON.parse(@steve.read))
    #   date = Date.new(1955, 2, 24)
    #   person.born.should === date
    # end
    
    # it "should return nil when birthday is unavailable" do
    #   person = Person.new({ 
    #     "created_at" => "Sat Dec 22 08:42:28 UTC 2007",
    #     "updated_at" => "Sat Dec 22 08:42:28 UTC 2007"})
    #   person.born.should be_nil
    # end
    
    # it "should get from web" do
    #   person = Person.get("steve-jobs")
    #   person.first_name.should == "Steve"
    # end
    
    # it "should get a complete list" do
    #   all_people = Person.all
    #   all_people[0].entity.first_name.should == all_people[0].first_name
    #   all_people[0].entity.last_name.should == all_people[0].last_name
    # end
    
  end
end
