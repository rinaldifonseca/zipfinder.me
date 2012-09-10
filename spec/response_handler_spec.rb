require File.dirname(__FILE__) + "/spec_helper"

describe ZipFinder::ResponseHandler do
  let(:json_adapter) { mock('json_adapter') }
  subject { ZipFinder::ResponseHandler.new(json_adapter) }
  let(:valid_response) {OpenStruct.new(:status => 200, :body => :body)}
  let(:invalid_response) {OpenStruct.new(:status => 404, :body => :body)}

  describe "#process" do
    it "parses the body response" do
      json_adapter.should_receive(:parse).with valid_response.body
      subject.process(valid_response)
    end

    it "raises a RequestFailedError" do
      expect {
        subject.process(invalid_response)
      }.to raise_error ZipFinder::RequestFailedError
    end
  end
end
