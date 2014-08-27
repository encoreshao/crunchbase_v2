require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe Founder do
    
    describe "advanced indexing" do
      before(:all) do
        @all_founders = Founder.lists_for_permalink("facebook")
      end

      it "should pull from web api" do
        @all_founders.per_page.should == 1000
        @all_founders.current_page.should == 1
        @all_founders.size.should == 5
        @all_founders.items.count.should == 5
      end
    end
    
  end
end
