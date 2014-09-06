require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe Category, :vcr  do
    subject { Category.lists_for_permalink("facebook") }

    it_has_behavior 'pagination'
    it_behaves_like 'a container', 7

    its(:size) { should eq(7) }


    it "return categories lists" do
      results = Category.list(1)
      results.per_page.should == 1000
    end
  end
end
