require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe PrimaryImage, :vcr  do
    subject { PrimaryImage.lists_for_permalink("facebook") }

    it_has_behavior 'pagination'

    describe "advanced indexing" do
      it "should get a company all primary image list" do
        subject.items[0].title.should == nil
      end
    end
  end
end
