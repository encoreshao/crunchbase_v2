require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe Competitor, :vcr  do
    subject { Competitor.lists_for_permalink("facebook") }

    it_has_behavior 'pagination'
    its(:size) { should eq(9) }
  end
end
