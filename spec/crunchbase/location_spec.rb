require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe Location, :vcr  do
    subject { Location.list(1) }

    it_has_behavior 'pagination'

    # it "return location lists" do
    #   puts results.items.first(3).inspect
    # end

  end
end
