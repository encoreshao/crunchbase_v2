require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe Founder, :vcr  do
    subject { Founder.lists_for_permalink("facebook") }

    it_behaves_like 'a container', 5

    its(:size) { should eq(5) }
  end
end
