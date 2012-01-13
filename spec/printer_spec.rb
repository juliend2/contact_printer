require 'spec_helper'

describe ContactPrinter::Printer do
  context "a Printer object" do
    before do
      @printer = ContactPrinter::Printer.new "spec/fixtures", "spec/config.yml"
    end
    it "should have 3 contacts" do
      @printer.contacts.size.should == 3
    end
  end
end
