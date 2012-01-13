module ContactPrinter

  class Printer
    def initialize(path_to_contacts, path_to_config_file)
      @path_to_contacts = path_to_contacts.chomp "/"
      @path_to_config = path_to_config_file
      @config = YAML::load File.open(@path_to_config)
      @contact_files = Dir.glob("#{@path_to_contacts}/*.md")
      check_files_exist!
    end

    # @return Array of Contact objects
    def contacts
      return @contacts unless @contacts.nil?
      @contacts = @contact_files.select {|file| 
        selected_contacts.include? File.basename(file).chomp('.md')
      }.map {|file|
        Contact.new file
      }
    end

    def check_files_exist!
      selected_contacts.each do |contact|
        unless File.exist?(full_path(contact))
          raise "#{full_path(contact)} does not exist"
          exit
        end
      end
    end

    # @return String
    def html_contacts
      contacts.map {|c| "<div class='contact'>" << c.to_html << "</div>" }.join('')
    end

    # @return Array of String objects
    def selected_contacts
      @config['contacts']
    end

    def render
      return @rendered unless @rendered.nil?
      @rendered = PDFKit.new(html_contacts, :page_size => 'Letter')
    end

    def print!
      Dir.mktmpdir do |dir|
        path = "#{dir}/tmp.pdf"
        render.to_file(path)
        puts "Printing..."
        # system("lpr", path) or raise "lpr failed"
      end
    end

    private

    def full_path(basename)
      "#{@path_to_contacts}/#{basename}.md"
    end
  end

end

