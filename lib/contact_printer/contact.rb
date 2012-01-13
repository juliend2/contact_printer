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
      lines = (text + "\n\n").match(/Phones\n------\n(.*?)\n\n/m)
      lines = lines[1] if lines && lines[1]
      if lines
        "<ul>" << lines.split(/\n/).map{ |l| 
          "<li>#{ l.match(/\* (.*)/)[1] }</li>" 
        }.join('') << "</ul>"
      end
    end

    def emails
      lines = (text + "\n\n").match(/Emails\n------\n(.*?)\n\n/m)
      lines = lines[1] if lines && lines[1]
      if lines
        "<ul>" << lines.split(/\n/).map{ |l| 
          "<li>#{ l.match(/\* (.*)/)[1] }</li>" 
        }.join('') << "</ul>"
      end
    end

    def to_html
      %{<h2>#{name}</h2>
#{phones}
#{emails}}
    end
  end

end

# contact_printer = ContactPrinter::Printer.new '/Users/jdesrosiers/Dropbox/perso/contacts'
# puts contact_printer.contacts[3].to_html

