require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe Product, :vcr  do
    subject { Product.lists_for_permalink("facebook") }

    it_has_behavior 'pagination'

    its(:size) { should eq(17) }

    # describe "advanced indexing" do

    #   it "should pull from web api" do
    #     @all_products.results.count.should == 16
    #   end
    # end

    # it "should pull from web api" do
    #   product = Product.get("internet-org")

    #   product.name.should == "Internet.org"
    #   product.permalink.should == "internet-org"
    # end

  end
end
