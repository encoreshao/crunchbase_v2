require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe Ipo, :vcr  do
    describe 'a list' do
      subject { Ipo.lists_for_permalink("facebook") }

      it_has_behavior 'pagination'
      it_behaves_like 'a container', 3

      its(:size) { should eq(3) }
    end

    describe 'an entity' do
      subject { Ipo.get("a3bc391490d52ba8529d1cfc20550a87") }

      its(:permalink) { should eq('a3bc391490d52ba8529d1cfc20550a87') }

      it 'has correct funded companies' do
        expect(subject.funded_companies[0].name).to eq('Facebook')
      end
    end
  end
end
