require File.dirname(__FILE__) + "/spec_helper"

describe ZipFinder::Client do
  let(:zipcode) { "37713172" }
  let(:url) { "#{ZipFinder::BASE_URL}/#{zipcode}" }

  it "calls the get method in a instance passing the zipcode" do
    ZipFinder::Client.any_instance.should_receive(:get).with(zipcode)
    ZipFinder::Client.get(zipcode)
  end

  describe ".get" do
    it "executes the http call" do
      http_adapter = mock
      response_handler = stub(:process => nil)
      subject = ZipFinder::Client.new(http_adapter, response_handler)
      http_adapter.should_receive(:http_get).with(url)
      subject.get(zipcode)
    end

    it "handles the request response" do
      http_adapter = stub(:http_get => :response)
      response_handler = mock
      subject = ZipFinder::Client.new(http_adapter, response_handler)
      response_handler.should_receive(:process).with(:response).and_return(:result)
      subject.get(zipcode).should == :result
    end
  end
end
