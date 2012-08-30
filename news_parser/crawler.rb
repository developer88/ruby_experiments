require 'rubygems'
require 'open-uri'
require 'nokogiri'
require "./item"
class Crawler

	def initialize
		@items = []
	end

	def crawl_for_items(count, url)
		raise "count variable is empty" unless count > 0
		parse_rss(count, url)
	end

	private

	def parse_rss(count, url)
		raise "No url provided" if url.length == 0
		rss = Nokogiri::XML(open('http://www.thevista.ru/rss.php'))
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

end