require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe PastTeam do
    describe "advanced indexing" do
      before(:all) do
        @all_past_teams = PastTeam.lists_for_permalink("facebook")
      end

      it "should pull from web api" do
        @all_past_teams.items_per_page.should == 1000
        @all_past_teams.current_page.should == 1
      end
    end
  end
end
