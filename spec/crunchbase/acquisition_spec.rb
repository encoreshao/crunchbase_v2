require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe Acquisition, :vcr do
    describe 'a list' do
      subject { Acquisition.lists_for_permalink("facebook") }

      its(:size) { should eq(49) }

      it_has_behavior 'pagination'
    end

    describe 'an entity' do
      subject { Acquisition.get("7a3d7915ed43073c0e4b5b0d7601def8") }

      its(:name) { should eq('Acquisition') }
      its(:permalink) { should eq('7a3d7915ed43073c0e4b5b0d7601def8') }
    end
  end
end
