require 'extensions/sitemap'
require 'lib/links_helpers'

activate :sprockets
after_configuration do
  sprockets.append_path(File.join(root, 'vendor/assets/javascripts'))
  sprockets.append_path(File.join(root, 'vendor/assets/stylesheets'))
  sprockets.append_path(File.join(root, 'vendor/assets/components'))
  sprockets.import_asset('modernizr')
end

###
## Blog settings
####

Time.zone = "Asia/Shanghai"

# CN Lang

activate :blog do |blog|
  blog.name = 'cn'
  blog.prefix = 'cn'

  blog.permalink = '{year}/{month}/{day}/{title}.html'
  blog.sources = '{year}-{month}-{day}-{title}.html'
  blog.taglink = "tags/{tag}.html"
  blog.layout = "article.cn"
  blog.summary_separator = /(READMORE)/
  blog.summary_length = 250
  blog.year_link = "{year}.html"
  blog.month_link = "{year}/{month}.html"
  blog.day_link = "{year}/{month}/{day}.html"
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "p{num}"
  blog.default_extension = ".md"
  blog.tag_template = "/cn/tag.html"
  blog.calendar_template = "/cn/calendar.html"
end

page "/cn/feed.xml", :layout => false

# Main Lang

proxy '/index.html', '/cn/index.html'

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
page 'robots.txt', layout: false
page 'humans.txt', layout: false

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :en do
#   page "/en/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

helpers LinksHelpers

### Assets PATH
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

###
# Syntax
###
activate :syntax

set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, smartypants: true, tables: true

set :haml, ugly: true

# Livereload
activate :livereload

# Build-specific configuration
configure :build do

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash, ignore: [/^fonts/]

  # Generate sitemap after build
  activate :sitemap_generator

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
