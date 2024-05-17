# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'https://thebloodtracker.com'
SitemapGenerator::Sitemap.compress = false

# add additional search engine
SitemapGenerator::Sitemap.search_engines[:bing] = "http://www.bing.com/webmaster/ping.aspx?sitemap=%s"
SitemapGenerator::Sitemap.search_engines[:baidu] = "http://ping.baidu.com/ping/RPC2"
SitemapGenerator::Sitemap.search_engines[:yandex] = "http://webmaster.yandex.ru/ping?sitemap=%s"

SitemapGenerator::Sitemap.create do
  add '/', priority: 1
  add '/users/sign_up', priority: 0.9
  add '/users/sign_in', priority: 0.9
  add '/news', priority: 0.8
  add '/cookie_policy', priority: 0.7
  add '/imprint', priority: 0.7
  add '/account_recovery/load_recovery_partial', priority: 0.4


  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
