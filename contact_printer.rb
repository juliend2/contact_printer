require 'rubygems'
# require 'pdfkit'

module ContactPrinter

  class Contact
    def initialize(path_to_contact)
      @path_to_contact = path_to_contact
    end

    def text
      return @text unless @text.nil?
      @text = File.open(@path_to_contact).read
    end

    def name
      text.split(/\n/).first
    end

    def phones
      lines = (text + "\n\n").match(/Phones\n------\n(.*?)\n\n/m)[1]
      if lines
        "<ul>" << lines.split(/\n/).map{ |l| 
          "<li>#{ l.match(/\* (.*)/)[1] }</li>" 
        }.join('') << "</ul>"
      end
    end

    def to_html
      %{<h2>#{name}</h2>
#{phones}
      }
    end
  end

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

