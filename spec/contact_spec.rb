require 'spec_helper'

describe ContactPrinter::Contact do
  context "A Contact" do
    before do
      @antony = ContactPrinter::Contact.new 'spec/fixtures/antony-chevrolet.md'
      @julius = ContactPrinter::Contact.new 'spec/fixtures/julius-caesar.md'
      @john = ContactPrinter::Contact.new 'spec/fixtures/john-doe.md'
      @jean = ContactPrinter::Contact.new 'spec/fixtures/jean-qwerty.md'
    end
    it "should have a name" do
      @antony.name.should == 'Antony Chevrolet'
    end
    it "should have two phone numbers" do
      @antony.phones.should == "<ul><li>514-555-1673</li><li>514-555-1234</li></ul>"
    end
    it "should have no phone number" do
      @john.phones.should be_nil
    end
    it "should have one email and one phone number" do
      @jean.emails.should == "<ul><li>jeanqwerty@telecom.ca</li></ul>"
      @jean.phones.should == "<ul><li>514-555-9652</li></ul>"
    end
    it "should have two emails" do
      @julius.emails.should == "<ul><li>julius@gmail.com</li><li>julius@hotmail.com</li></ul>"
      @john.emails.should == "<ul><li>has.no@phonenumbers.com</li><li>but.has@emails.com</li></ul>"
    end
    it "should render to HTML" do
      @julius.to_html.should == %{<h2>Julius Caesar</h2>
<ul><li>514-555-1673</li><li>514-555-1234</li></ul>
<ul><li>julius@gmail.com</li><li>julius@hotmail.com</li></ul>}
      @antony.to_html.should == %{<h2>Antony Chevrolet</h2>
<ul><li>514-555-1673</li><li>514-555-1234</li></ul>
}
    end
  end
end
