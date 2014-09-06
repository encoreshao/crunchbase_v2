require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe Investment, :vcr  do
    subject { Investment.lists_for_permalink("facebook") }

    it_has_behavior 'pagination'
    it_behaves_like 'a container', 3

    its(:size) { should eq(3) }
  end
end
