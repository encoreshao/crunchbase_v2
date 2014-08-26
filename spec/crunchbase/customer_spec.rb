require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe Customer do

    describe "advanced indexing" do
      before(:all) do
        @all_customers = Customer.lists_for_permalink("facebook")
      end

      it "should pull from web api" do
        @all_customers.items_per_page.should == 1000
        @all_customers.current_page.should == 1
        @all_customers.total_items.should == 1
        @all_customers.items.count.should == 1
      end
    end

  end
end
