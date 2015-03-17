require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe CurrentTeam, :vcr  do
    subject { CurrentTeam.lists_for_permalink("facebook") }

    it_has_behavior 'pagination'

    its(:size) { should eq(139) }
  end
end
