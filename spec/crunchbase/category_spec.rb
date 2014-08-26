require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe Category do

    describe "advanced indexing" do
      before(:all) do
        @all_categories = Category.lists_for_permalink("facebook")
      end

      it "should pull from web api" do
        @all_categories.items_per_page.should == 1000
        @all_categories.current_page.should == 1
        @all_categories.total_items.should == 7
        @all_categories.items.count.should == 7
      end
    end
  end
end
