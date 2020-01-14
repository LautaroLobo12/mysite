###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml',  layout: false
page '/*.json', layout: false
page '/*.txt',  layout: false

# Disable directory_index for 404 page
page '/404.html', directory_index: false

###
# Helpers and extensions
###

helpers do
  # Builds a page title from the article title + site title
  def page_title
    if current_article && current_article.title
      current_article.title + ' | ' + config[:site_title]
    else
      config[:site_title]
    end
  end
  # Renders component partials
  def component(path, locals={})
    partial "components/#{path}", locals
  end
end

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  #blog.prefix = "blog"
  blog.permalink = 'blog/{title}'
  # Matcher for blog source files
  blog.sources = 'articles/{year}-{month}-{day}-{title}.html'
  blog.layout = 'article'
  blog.default_extension = '.md.erb'
  activate :directory_indexes
  #blog.taglink = "tags/{tag}.html"
  blog.paginate = true
  blog.page_link = "p{num}"
  blog.per_page = 9
end

# Markdown and syntax highlighting
activate :syntax
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

# Use commit time from git for sitemap.xml and feed.xml
activate :vcs_time

###
# Site settings
###
set :site_url, 'https://lautarolobo.xyz/'
set :site_title, 'Lautaro Jordan Lobo Ravarotto'
set :site_subtitle, 'Web Developer | Computer Science Student'
set :profile_text, %q(Hi! I'm Lautaro and this is my blog, where I write all content related to Web Development and Computer Science, to share it with you and my older self... anyways, if you like my content, <a href="javascript:;" onclick="ml_account('webforms', '1426892', 'g8s3m6', 'show')">I have a newsletter!</a>)
set :site_author, 'Lautaro Jordan Lobo Ravarotto'
# Generate your own by running `rake id`
set :site_id, 'urn:uuid:4b6fc0ee-c5f9-4c67-849f-b220d14bb6f1'

# Usernames
set :github_username, 'LautaroLobo12'
set :keybase_username, 'example'
set :twitter_username, 'example'
set :linkedin_username, 'lautarolobo'
set :lastfm_username, 'example'
set :spotify_username, 'example'
set :instagram_username, 'lautarolr9'
set :telegram_username, 'LautaroLobo'
set :codepen_username, 'LautaroLobo'

# Replace 'nil' with your Disqus shortname, eg. 'example'
set :disqus_shortname, 'lautarolobo'
# Replace 'nil' with your Google Analytics key, eg. 'XX-XXXXXXXX-X'
set :google_analytics, 'UA-138446504-1'

###
# Environment settings
###
# Development-specific configuration
configure :development do
  # Reload the browser automatically whenever files change (not working, check/update before even trying)
  # activate :livereload
end

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :minify_html

  # Improve cacheability by using asset hashes in filenames
  activate :asset_hash
end

# Time Zone
require 'tzinfo'
Time.zone = 'America/Argentina/Cordoba'
