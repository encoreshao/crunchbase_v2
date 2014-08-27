require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe Ipo do

    describe "advanced indexing" do
      before(:all) do
        @all_ipos = Ipo.lists_for_permalink("facebook")
      end

      it "should pull from web api" do
        @all_ipos.per_page.should == 1000
        @all_ipos.current_page.should == 1
        @all_ipos.size.should == 3
        @all_ipos.items.count.should == 3

        puts @all_ipos.items.inspect
      end
    end

    it "should pull from web api" do
      ipo = Ipo.get("a3bc391490d52ba8529d1cfc20550a87")

      ipo.permalink.should == 'a3bc391490d52ba8529d1cfc20550a87'
      ipo.funded_companies[0].name.should == 'Facebook'
    end

  end
end
