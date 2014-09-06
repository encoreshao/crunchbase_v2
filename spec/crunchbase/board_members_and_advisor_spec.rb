require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe BoardMembersAndAdvisor, :vcr  do
    subject { BoardMembersAndAdvisor.lists_for_permalink("facebook") }

    it_has_behavior 'pagination'
  end
end
