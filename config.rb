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
  if file.length > 2
    data = Middleman::Util::EnhancedHash.load("./data/properties/#{file}")
    data.merge({ url: "/forestland-for-sale/#{data.title.parameterize}" })
  end
end.compact

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)

# Create a page for each property listing
property_listings.map do |listing|
  proxy listing.url,
        '/forestland-for-sale/property-page-template.html',
        layout: :layout,
        locals: { property: listing },
        ignore: true
end

ready do
  # Augment the page data with the generate listing path
  # https://github.com/middleman/middleman/issues/1110#issuecomment-30109174
  property_listings.each do |listing|
    resource = sitemap.find_resource_by_path listing.url
    resource.add_metadata page: {
      title: listing.title
    }
  end

  # Augment the index page with listing data
  resource = sitemap.find_resource_by_path 'forestland-for-sale/index.html'
  resource.add_metadata locals: {
    active_listings: property_listings.reject(&:sold),
    inactive_listings: property_listings.select(&:sold)
  }
end

# Build-specific configuration
configure :build do
end

configure :staging do
  # Minify CSS on build
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Fingerprint assets
  # activate :asset_hash, exts: %w[.css]

  activate :s3_sync do |s3_sync|
    s3_sync.bucket = 'worldforestinvestment-staging.com'
    s3_sync.delete = false
  end

  # Caching
  caching_policy 'text/html', max_age: 0, must_revalidate: true
end

configure :production do
  # Minify CSS on build
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  activate :s3_sync do |s3_sync|
    s3_sync.bucket = 'worldforestinvestment.com'
    s3_sync.delete = false
  end
end
