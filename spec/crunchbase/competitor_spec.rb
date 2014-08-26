require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe Competitor do
    
    describe "advanced indexing" do
      before(:all) do
        @all_competitors = Competitor.lists_for_permalink("facebook")
      end

      it "should pull from web api" do
        @all_competitors.items_per_page.should == 1000
        @all_competitors.current_page.should == 1
        @all_competitors.total_items.should == 9
      end
    end
    
  end
end
