require 'rubygems'
require 'pdfkit'

class ContactPrinter
  def initialize(path_to_contacts)
    @path_to_contacts = path_to_contacts.chomp("/")
  end

  def contacts
    @contacts ||= Dir.glob("#{@path_to_contacts}/*.md")
  end

end

contact_printer = ContactPrinter.new '/Users/jdesrosiers/Dropbox/perso/contacts'
puts contact_printer.contacts

