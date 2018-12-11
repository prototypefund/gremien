# Load DSL and set up stages
require 'capistrano/setup'

# Include default deployment tasks
require 'capistrano/deploy'

require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

# Include tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails
#   https://github.com/capistrano/passenger
#
# require 'capistrano/rvm'
# require 'capistrano/rbenv'
# require 'capistrano/chruby'
# require 'capistrano/passenger'
require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'

begin
  require 'whenever/capistrano'
  require 'capistrano/maintenance'
rescue LoadError
  # missing in the Gemfile
end

Dir.glob('lib/capistrano/tasks/*.rake').each do |r|
  # `import r` calls Rake.application.add_import(r), which imports the file only
  # *after* this file has been processed, so the imported tasks would not be
  # available to the hooks below.
  Rake.load_rakefile r
end

after 'deploy:published', 'deploy:restart'
after 'deploy:finished', 'deploy:cleanup'
