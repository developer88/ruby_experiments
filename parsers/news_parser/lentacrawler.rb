# coding: utf-8
require './crawler'
class LentaCrawler  < Crawler
	
	def initialize(count)
		@url = 'http://lenta.ru/rss/'
		@fromencoding = "Windows-1251"
		@referer = "http://www.lenta.ru/"
		@host = 'lenta.ru'		
		super
	end

	def parse_item(url, date, title)
		return nil if url.size == 0
		url = "http://lenta.ru/news/2012/08/30/kvasha/"
		doc = Nokogiri::HTML(get_page_content(url),nil,"Windows-1251")	
		text = doc.search("#pacman").search("td:first").inner_html.encode("UTF-8",@fromencoding)
		collect_item(url, title, date, text)
	end
	
end