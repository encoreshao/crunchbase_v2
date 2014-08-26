require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe SubOrganization do
    
    describe "advanced indexing" do
      before(:all) do
        @all_sub_organizations = SubOrganization.lists_for_permalink("facebook")
      end

      it "should pull from web api" do
        @all_sub_organizations.items_per_page.should == 1000
        @all_sub_organizations.current_page.should == 1
        @all_sub_organizations.total_items.should == 2

        puts @all_sub_organizations.items.inspect
      end
    end
    
  end
end
