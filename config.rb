require 'dotenv/load'
require_relative 'lib/font_awesome_helper'
ignore 'stylesheets/sass/**/*.sass'

set :build_dir, 'public'
activate :directory_indexes

configure :build do
  activate :minify_css
  activate :minify_javascript
end

helpers FontAwesomeHelper