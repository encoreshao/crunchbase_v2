require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe Headquarter do
    describe "advanced indexing" do
      before(:all) do
        @all_headquarters = Headquarter.lists_for_permalink("facebook")
      end

      it "should pull from web api" do
        @all_headquarters.per_page.should == 1000
        @all_headquarters.current_page.should == 1
        @all_headquarters.items.count.should == 1
      end
    end
  end
end
