require 'uri'
require 'open-uri'

class WebCrawler
  def initialize
    @discovered_sites = []
    @regexp = %r{(^$)|(^(http|https)://[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?/.*)?$)}ix
  end

  # BFS implementation
  def crawl(start_url)
    queue = [start_url]
    @discovered_sites.push(start_url)

    while queue

      actual_url = queue.pop
      puts 'URL: ' + actual_url

      # raw html of given website (url)
      actual_url_html = read_raw_html(actual_url)

      get_links_from_html(actual_url_html).each do |url|
        unless @discovered_sites.include?(url)
          @discovered_sites.push(url)
          queue.push(url)
        end
      end
    end
  end

  def read_raw_html(url)
    raw_html = ''

    begin
      raw_html = URI.open(url).read
    rescue StandardError => e
      puts "ERROR:: Cound not open: #{url} " + e.inspect
    end
    raw_html
  end

  def get_links_from_html(raw_html)
    found_urls = []
    tmp = URI.extract(raw_html, %w[http https])
    tmp.each do |raw_uri|
      found_urls.push(raw_uri.split('/')[0, 3].join('/'))
    end
    found_urls
  end
end

crawler = WebCrawler.new
crawler.crawl('https://www.ccn.com/')
