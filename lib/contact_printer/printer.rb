require 'yaml'

module ContactPrinter

  class Printer
    def initialize(path_to_contacts, path_to_config_file)
      @path_to_contacts = path_to_contacts.chomp "/"
      @path_to_config = path_to_config_file
      @config = YAML::load File.open(@path_to_config)
      @contact_files = Dir.glob("#{@path_to_contacts}/*.md")
    end

    def contacts
      return @contacts unless @contacts.nil?
      @contacts = @contact_files.select {|file| 
        selected_contacts.include? File.basename(file).chomp('.md')
      }.map {|file|
        Contact.new file
      }
    end

    def selected_contacts
      @config['contacts']
    end

    def render
      kit = PDFKit.new(html, :page_size => 'Letter')
    end
  end

end

