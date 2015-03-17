require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe Organization, :vcr  do
    subject { Organization.get("facebook") }

    its(:name) { should eq('Facebook') }
    its(:competitors_total_items) { should eq(9) }
    its(:customers_total_items) { should eq(1) }
    its(:founders_total_items) { should eq(5) }
    its(:funding_rounds_total_items) { should eq(11) }
    its(:ipos_total_items) { should eq(3) }
    its(:products_total_items) { should eq(17) }
    its(:sub_organizations_total_items) { should eq(2) }

    its(:past_teams_total_items) { should eq(187) }
    its(:current_teams_total_items) { should eq(139) }
    its(:acquisitions_total_items) { should eq(49) }
    its(:offices_total_items) { should eq(3) }
    its(:headquarters_total_items) { should eq(1) }
    its(:categories_total_items) { should eq(7) }
    its(:investments_total_items) { should eq(3) }
    its(:primary_images_total_items) { should eq(1) }
    its(:images_total_items) { should eq(1) }
    its(:websites_total_items) { should eq(6) }
    its(:new_items_total_items) { should eq(3118) }
    its(:board_members_and_advisors_total_items) { should eq(12) }

    describe '.search' do
      subject { Organization.search({ domain_name: "facebook.com", organization_types: 'company' }) }

      it_has_behavior 'pagination'
    end
  end
end
