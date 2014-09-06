require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe Customer, :vcr  do
    subject { Customer.lists_for_permalink("facebook") }

    it_has_behavior 'pagination'
    it_behaves_like 'a container', 1

    its(:size) { should eq(1) }
  end
end
