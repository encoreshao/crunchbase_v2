require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe SubOrganization, :vcr  do
    subject { SubOrganization.lists_for_permalink("facebook") }

    it_has_behavior 'pagination'

    its(:size) { should eq(2) }
  end
end
