if RAILS_ENV == "test"

  require 'remarkable_activerecord'

  require File.join(File.dirname(__FILE__), "lib", "remarkable_liquid")

  require 'spec'
  require 'spec/rails'

  Remarkable.include_matchers!(Remarkable::Liquid, Spec::Rails::Example::ModelExampleGroup)
  Remarkable.include_matchers!(Remarkable::Liquid, Spec::Rails::Example::HelperExampleGroup)

end
