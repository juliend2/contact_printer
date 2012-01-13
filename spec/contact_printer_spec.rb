require 'rubygems'
require 'rspec'
require '../contact_printer'

describe ContactPrinter::Contact do
  context "A Contact" do
    before do
      @antony = ContactPrinter::Contact.new './fixtures/antony-chevrolet.md'
      @julius = ContactPrinter::Contact.new './fixtures/julius-caesar.md'
    end
    it "should have a name" do
      @antony.name.should == 'Antony Chevrolet'
    end
    it "should have two phone numbers" do
      @antony.phones.should == "<ul><li>514-555-1673</li><li>514-555-1234</li></ul>"
    end
    it "should have two emails" do
      @julius.emails.should == "<ul><li>julius@gmail.com</li><li>julius@hotmail.com</li></ul>"
    end
    it "should render to HTML" do
      @julius.to_html.should == %{<h2>Julius Caesar</h2>
<ul><li>514-555-1673</li><li>514-555-1234</li></ul>
<ul><li>julius@gmail.com</li><li>julius@hotmail.com</li></ul>}
    end
  end
end
