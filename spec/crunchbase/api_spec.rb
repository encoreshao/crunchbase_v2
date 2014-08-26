require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")
require 'net/http'

module Crunchbase
  describe API do

    # it "should raise exception for missing API key" do
    #   key = API.key
    #   API.key = nil
    #   expect { API.fetch('encoreshao', 'person') }.to raise_error
    #   API.key = key
    # end
    
    # it "should return a JSON hash" do
    #   j = API.fetch('encoreshao', 'person')
    #   j.class.should == Hash
    # end
    
    # it "should return JSON from person permalink" do
    #   j = API.single_entity("encoreshao", "person")
    #   j.class.should == Hash
    # end

  end
end
