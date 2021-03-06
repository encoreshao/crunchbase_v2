require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe Website, :vcr do
     subject { Website.lists_for_permalink("facebook") }

    it_has_behavior 'pagination'
    it_behaves_like 'a container', 6
  end
end
