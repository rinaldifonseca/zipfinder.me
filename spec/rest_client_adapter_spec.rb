require File.dirname(__FILE__) + "/spec_helper"

describe ZipFinder::RestClientAdapter do
  subject { ZipFinder::RestClientAdapter }
  let(:response) { OpenStruct.new(:code => 200, :body => :body) }

  describe "#http_get" do
    it "delegates to RestClient and return a custom Struct" do
      expected = OpenStruct.new(:status => response.code, :body => response.body)
      RestClient.should_receive(:get).with(:url, {}).and_return(response)
      subject.http_get(:url, {}).should == expected
    end

    it "raises a ServiceNotAvailableError" do
      RestClient.should_receive(:get).and_raise RestClient::Exception
      expect {
        subject.http_get(:url, {})
      }.to raise_error(ZipFinder::ServiceNotAvailableError)
    end
  end
end
