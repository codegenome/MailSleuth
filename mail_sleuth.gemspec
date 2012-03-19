$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mail_sleuth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mail_sleuth"
  s.version     = MailSleuth::VERSION
  s.authors     = ["Nicolas Buduroi"]
  s.email       = ["nbuduroi@gmail.com"]
  s.homepage    = "TBA"
  s.summary     = "This plugin provide a configurable observer for ActionMailer."
  s.description = "See README.md file."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.1"

  s.add_development_dependency "sqlite3"
end
