require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe Organization do

    describe "Get Organization object from premalink" do
      before(:all) do
        @company = Organization.get("facebook")
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
      
      it "show somethings" do
        # show Top 8 Websites
        @company.websites_total_items.should == 6
        puts @company.websites.inspect
        # show Top 8 news
        @company.new_items_total_items.should == 3116
        puts @company.new_items.inspect
        # show organization logo url
        puts @company.logo_url
      end

    end

    it "Search organizations by name" do
      results = Organization.search({ domain_name: "facebook.com", organization_types: 'company' })

      results.items_per_page.should == 1000
      results.current_page.should == 1
      results.items[0].name.should == 'Facebook'
    end
    
  end
end
