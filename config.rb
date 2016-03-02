require 'middleman-core/util/data'
require 'active_support'

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

property_listings = Dir.entries('./data/properties/').map do |file|
   Middleman::Util::EnhancedHash.load("./data/properties/#{file}") if file.length > 2
end.compact

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
property_listings.map do |property|
  proxy "/forestland-for-sale/#{property.title.parameterize}",
        '/forestland-for-sale/property-page-template.html',
        layout: :layout,
        locals: { property: property },
        ignore: true
end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end

###
# Deployment
###

activate :s3_sync do |s3_sync|
  s3_sync.bucket = 'worldforestinvestment.com'
end
