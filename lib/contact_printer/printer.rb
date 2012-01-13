require 'rubygems'
require "bundler"
Bundler.require :default
require 'yaml'
require 'tmpdir'

module ContactPrinter

  class Printer
    def initialize(path_to_contacts, path_to_config_file)
      @path_to_contacts = path_to_contacts.chomp "/"
      @path_to_config = path_to_config_file
      @config = YAML::load File.open(@path_to_config)
      @contact_files = Dir.glob("#{@path_to_contacts}/*.md")
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

    def print
      Dir.mktmpdir do |dir|
        path = "#{dir}/tmp.pdf"
        render.to_file(path)
        system("lpr", path) or raise "lpr failed"
      end
    end
  end

end

