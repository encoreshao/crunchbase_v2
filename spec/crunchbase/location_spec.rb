require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe Location do

    it "return location lists" do
      results = Location.list(1)

      results.per_page.should == 1000
      results.current_page.should == 1

      puts results.items.first(3).inspect
    end

  end
end
