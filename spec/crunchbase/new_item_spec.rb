require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe NewItem, :vcr  do
    subject { NewItem.lists_for_permalink("facebook") }

    it_has_behavior 'pagination'
    it_behaves_like 'a container', 1000

    describe 'paging' do
      let(:page) { 4 }
      subject { NewItem.lists_for_permalink("facebook", {page: page}) }

      its(:next_page_url) { should be nil }
      its(:per_page) { should eq(1000) }
      its(:current_page) { should eq(page) }
    end
  end
end
