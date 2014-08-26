require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe NewItem do

    describe "advanced indexing" do
      before(:all) do
        @all_news = NewItem.lists_for_permalink("facebook")
      end

      it "should pull from web api" do
        puts @all_news.items.first.title
        puts @all_news.next_page_url
        
        @all_news.items_per_page.should == 1000
        @all_news.current_page.should == 1
      end

      it "should get oranization all news list" do
        @all_news.items.count.should == 3116
      end
    end

    it "Fetched all news data paging" do
      page = 4
      second_news = NewItem.lists_for_permalink("facebook", {page: page})
      
      second_news.next_page_url.should  == nil
      second_news.items_per_page.should == 1000
      second_news.current_page.should   == page
    end
  end
end
