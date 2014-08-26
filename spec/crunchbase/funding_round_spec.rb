require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe FundingRound do

    describe "advanced indexing" do
      before(:all) do
        @all_funding_rounds = FundingRound.lists_for_permalink("facebook")
      end

      it "check the return results is correct" do
        @all_funding_rounds.items_per_page.should == 1000
        @all_funding_rounds.current_page.should == 1
        @all_funding_rounds.total_items.should == 11
        @all_funding_rounds.items.count.should == 11
      end
    end
    
    it "should pull from web api" do
      funding_round = FundingRound.get("37bd05f961af726ba3c1b279da842805")

      funding_round.permalink.should == '37bd05f961af726ba3c1b279da842805'
    end

  end
end
