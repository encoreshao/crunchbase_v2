require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe BoardMembersAndAdvisor do
    describe "advanced indexing" do
      before(:all) do
        @all_board_members_and_advisors = BoardMembersAndAdvisor.lists_for_permalink("facebook")
      end

      it "should pull from web api" do
        @all_board_members_and_advisors.items_per_page.should == 1000
        @all_board_members_and_advisors.current_page.should == 1
      end
    end
  end
end
