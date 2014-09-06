require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe FundingRound, :vcr  do
    describe 'a list' do
      subject { FundingRound.lists_for_permalink("facebook") }

      it_has_behavior 'pagination'
      it_behaves_like 'a container', 11

      its(:size) { should eq(11) }
    end

    describe 'an entity' do
      subject { FundingRound.get("37bd05f961af726ba3c1b279da842805") }

      its(:permalink) { should eq('37bd05f961af726ba3c1b279da842805') }
    end
  end
end
