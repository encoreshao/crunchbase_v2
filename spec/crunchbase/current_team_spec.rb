require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe CurrentTeam do
    describe "advanced indexing" do
      before(:all) do
        @all_current_teams = CurrentTeam.lists_for_permalink("facebook")
      end

      it "should pull from web api" do
        @all_current_teams.items_per_page.should == 1000
        @all_current_teams.current_page.should == 1
        @all_current_teams.total_items.should == 137
      end
    end
  end
end
