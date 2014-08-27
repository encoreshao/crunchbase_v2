require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe Website do

    describe "advanced indexing" do
      before(:all) do
        @all_websites = Website.lists_for_permalink("facebook")
      end

      it "should pull from web api" do
        puts @all_websites.items.first.title
        puts @all_websites.next_page_url
        
        @all_websites.per_page.should == 1000
        @all_websites.current_page.should == 1
        @all_websites.items.count.should == 6
      end

      it "Show Top 8 websites" do
        puts @all_websites.items.inspect
      end
    end
  end
end
