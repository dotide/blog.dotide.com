require 'extensions/sitemap.rb'
require 'zurb-foundation'

activate :sprockets

# Unfortunately ZURB puts its assets in unconventional paths, so we need to
# manually add these paths for sprockets to find them. However, the following
# only works within the middleman server but there doesn't seem to be any
# way to get sprockets to export the vendored assets within the foundation
# gem to the build directory because of the non-standard naming of the directories.
# Keeping this here for reference though.
#Gem.loaded_specs.values.map(&:full_gem_path).each do |root_path|
#  ["js", "scss"].map {|p| File.join(root_path, p) }.select {|p| File.directory?(p) }.each {|p| sprockets.append_path(p)}
#end

###
## Blog settings
####

Time.zone = "Asia/Shanghai"

activate :blog do |blog|
  blog.prefix = "/en"
  blog.permalink = ":year/:month/:day/:title.html"
  blog.sources = ":year-:month-:day-:title.html"
  blog.taglink = "tags/:tag.html"
  blog.layout = "article"
  blog.summary_separator = /(READMORE)/
  blog.summary_length = 250
  blog.year_link = ":year.html"
  blog.month_link = ":year/:month.html"
  blog.day_link = ":year/:month/:day.html"
  blog.default_extension = ".md"

  blog.tag_template = "/en/tag.html"
  blog.calendar_template = "/en/calendar.html"

  blog.paginate = true
  blog.per_page = 5
  blog.page_link = "page/:num"
end

page "/en/feed.xml", :layout => false

###
# Compass
###

# Susy grids in Compass
# First: gem install susy
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# With no layout
page "robots.txt", :layout => false
page "humans.txt", :layout => false

# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###
require "extensions/links_helpers"
helpers LinksHelpers

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Generate sitemap after build
activate :sitemap_generator

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

###
# Syntax
###
activate :syntax

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

set :haml, { ugly: true }

###
# Deploy
###
activate :deploy do |deploy|
  deploy.method   = :ftp
  deploy.host     = "v0.ftp.upyun.com"
  deploy.user     = 'cms-admin/dotide-blog'
  deploy.password = ENV['password']
  deploy.path     = "/"
  deploy.build_before = true
end

# Build-specific configuration
configure :build do

  activate :minify_css
  activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  require "middleman-smusher"
  activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end
