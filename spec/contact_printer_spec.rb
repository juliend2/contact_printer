require 'rubygems'
require 'rspec'
require '../contact_printer'

describe ContactPrinter::Contact do
  context "A Contact" do
    before do
      @antony = ContactPrinter::Contact.new './fixtures/antony-chevrolet.md'
    end
    it "should have a name" do
      @antony.name.should == 'Antony Chevrolet'
    end
    it "should have two phone numbers" do
      @antony.phones.should == "<ul><li>514-555-1673</li><li>514-555-1234</li></ul>"
    end
  end
end
