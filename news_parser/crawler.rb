require 'rubygems'
require 'open-uri'
require 'nokogiri'
require "./item"
class Crawler
	@count = 5

	def initialize(count)
		@count = count.to_i > 0 ? count.to_i : 5 
		@items = []
	end

	def crawl_for_items
		raise "url variable is empty" if @url.size == 0
		parse_rss(@count, @url)
	end

	private

	def parse_rss(count, url)
		raise "No url provided" if url.length == 0
		rss = Nokogiri::XML(get_page_content(url))
		rss.css("item").each_with_index do |n,i|
			parse_item(n.search("link").inner_text, n.search("pubDate").inner_text, n.search("title").inner_text)
			break if i+1 == count
		end
		@items
	end

	def parse_item(url, date, title)
		raise "Cannon perform from parent class"
	end	

	def collect_item(url, title, date, text)
		item = Item.new
		item.title = title
		item.date = date
		item.text = text
		item.url = url	
		@items << item
	end

	def get_page_content(url)
	    begin
	    	return open(URI.parse(url),
              'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:5.0) Gecko/20100101 Firefox/5.0',
              'Accept' => '	text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
              'Accept-Language' => 'ru-ru,ru;q=0.8,en-us;q=0.5,en;q=0.3',
              'Accept-Charset' => 'utf-8;q=0.7,*;q=0.7',
              'Referer' => @referer)
  		#rescue Exception => e
      	#	return nil
      	end
	end

end