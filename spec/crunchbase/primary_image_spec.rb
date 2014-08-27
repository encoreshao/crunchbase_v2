require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe PrimaryImage do

    describe "advanced indexing" do
      before(:all) do
        @all_primary_image = PrimaryImage.lists_for_permalink("facebook")
      end

      it "should pull from web api" do
        @all_primary_image.per_page.should == 1000
        @all_primary_image.current_page.should == 1
      end

      it "should get a company all primary image list" do
        @all_primary_image.items[0].title.should == nil
      end
    end
  end
end
