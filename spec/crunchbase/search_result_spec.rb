require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")
require 'net/http'

module Crunchbase
  describe SearchResult, :vcr  do
    subject { Search.find('google').results[0] }

    its(:name) { should eq('Google') }
  end
end
