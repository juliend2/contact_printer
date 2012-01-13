require 'spec_helper'

describe ContactPrinter::Printer do
  context "a Printer object" do
    before do
      @printer = ContactPrinter::Printer.new "spec/fixtures", "spec/config.yml"
    end
    it "should have 3 contacts" do
      @printer.contacts.size.should == 3
    end
    it "should output a pdf" do
      @printer.render
    end
    it "should print the pdf" do
      # Commented out since we don't want to kill a tree each time rspec is run
      # @printer.print 
    end
  end
end
