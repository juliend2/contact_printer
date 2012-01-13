# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require "contact_printer/version"

Gem::Specification.new do |s|
  s.name        = "contact_printer"
  s.version     = ContactPrinter::VERSION
  s.authors     = ["Julien Desrosiers"]
  s.email       = ["hello@juliendesrosiers.com"]
  s.homepage    = "https://github.com/juliend2/contact_printer"
  s.summary     = %q{A ruby script to print a sheet with my important contacts}
  s.description = %q{A ruby script to print a sheet with my important contacts (taxi, etc) when on the go.}


  s.rubyforge_project = "contact_printer"

  s.files         = `git ls-files`.split("\n")
  s.executables   = ['print_contacts']
  s.default_executable = 'print_contacts'
  s.bindir        = 'bin'
  s.require_paths = ["lib"]

  s.post_install_message = %{Please create a contact_printer.yml in your contacts directory that has this format:
contacts:
- antony-chevrolet
- jean-qwerty
- john-doe
}

  s.add_runtime_dependency "pdfkit", '~> 0.5.2'
  s.add_development_dependency "rspec", '~> 2.8.0'
end

