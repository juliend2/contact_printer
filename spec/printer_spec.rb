require 'spec_helper'

describe ContactPrinter::Printer do
  context "a Printer object" do
    before do
      @printer = ContactPrinter::Printer.new "spec/fixtures"
    end
    it "should have 4 contacts" do
      @printer.contacts.size.should == 4
    end
  end
end
