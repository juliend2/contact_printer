require 'rubygems'
# require 'pdfkit'

module ContactPrinter

  class Printer
    def initialize(path_to_contacts)
      @path_to_contacts = path_to_contacts.chomp("/")
      @contact_files = Dir.glob("#{@path_to_contacts}/*.md")
    end

    def contacts
      return @contacts unless @contacts.nil?
      @contacts = @contact_files.map{|file| Contact.new file }
    end
  end

end

# contact_printer = ContactPrinter::Printer.new '/Users/jdesrosiers/Dropbox/perso/contacts'
# puts contact_printer.contacts[3].to_html

