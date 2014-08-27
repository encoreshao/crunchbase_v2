require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe Investment do
    
    describe "advanced indexing" do
      before(:all) do
        @all_investments = Investment.lists_for_permalink("facebook")
      end

      it "should pull from web api" do
        @all_investments.per_page.should == 1000
        @all_investments.current_page.should == 1
        @all_investments.size.should == 3
        @all_investments.items.count.should == 3
      end
    end
    
  end
end
