require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe PastTeam, :vcr  do
    subject { PastTeam.lists_for_permalink("facebook") }

    it_has_behavior 'pagination'
  end
end
