require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe Organization do

    describe "Get Organization object from premalink" do
      before(:all) do
        @company = Organization.get("facebook")
      end

      it "should loading relationship data" do
        puts @company.websites_total_items
        puts @company.websites.inspect
        teams = Website.lists_for_permalink(@company.permalink)
      end

      it "should organization's websites data" do
        # Top 8 websites
        puts @company.websites
        # Show websites total count
        puts @company.websites_total_items
        # Show organization's websites list search by organization permalink
        teams = Website.lists_for_permalink(@company.permalink)
      end

      it "should pull from web api" do
        @company.name.should == "Facebook"
        @company.competitors_total_items.should == 9
        @company.customers_total_items.should == 1
        @company.founders_total_items.should == 5
        @company.funding_rounds_total_items.should == 11
        @company.ipos_total_items.should == 3
        @company.products_total_items.should == 16
        @company.sub_organizations_total_items.should == 2

        @company.past_teams_total_items.should == 186
        @company.current_teams_total_items.should == 137
        @company.acquisitions_total_items.should == 49
        @company.offices_total_items.should == 3
        @company.headquarters_total_items.should == 1
        @company.categories_total_items.should == 7
        @company.investments_total_items.should == 3
        @company.primary_images_total_items.should == 1
        @company.images_total_items.should == 1
        @company.websites_total_items.should == 6
        @company.new_items_total_items.should == 3116
        @company.board_members_and_advisors_total_items.should == 12
      end
      

    end

    it "Search organizations by name" do
      results = Organization.search({ domain_name: "facebook.com", organization_types: 'company' })

      results.per_page.should == 1000
      results.current_page.should == 1
      puts results.results[0].inspect
    end
    
  end
end
