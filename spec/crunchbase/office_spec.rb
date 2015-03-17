require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Crunchbase
  describe Office, :vcr  do
    subject { Office.lists_for_permalink("facebook") }

    it_has_behavior 'pagination'
    it_behaves_like 'a container', 3
  end
end
