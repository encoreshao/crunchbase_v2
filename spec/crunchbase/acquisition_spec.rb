require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe Acquisition do

    describe "advanced indexing" do
      before(:all) do
        @all_acquisitions = Acquisition.lists_for_permalink("facebook")
      end

      it "should pull from web api" do
        @all_acquisitions.items_per_page.should == 1000
        @all_acquisitions.current_page.should == 1
        @all_acquisitions.total_items.should == 49
      end
    end
    
    it "should pull from web api" do
      acquisition = Acquisition.get("7a3d7915ed43073c0e4b5b0d7601def8")

      acquisition.name.should == "Acquisition"
      acquisition.permalink.should == "7a3d7915ed43073c0e4b5b0d7601def8"
    end

  end
end
