require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe Office do
    describe "advanced indexing" do
      before(:all) do
        @all_offices = Office.lists_for_permalink("facebook")
      end

      it "should pull from web api" do
        @all_offices.items_per_page.should == 1000
        @all_offices.current_page.should == 1
        @all_offices.items.count.should == 3

        puts @all_offices.items.inspect
      end
    end
  end
end
