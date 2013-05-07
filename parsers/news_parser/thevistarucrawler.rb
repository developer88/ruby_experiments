# coding: utf-8
require './crawler'
class TheVistaRuCrawler < Crawler

	def initialize(count)
		@url = "http://www.thevista.ru/rss.php"
		@fromencoding = "Windows-1251"
		@referer = "http://www.thevista.ru/"
		super
	end

	def parse_item(url, date, title)
		return nil if url.size == 0
		doc = Nokogiri::HTML(get_page_content(url))		
		text = doc.search("div#hypercontext").inner_html.encode("UTF-8",@fromencoding)
		collect_item(url, title, date, text)
	end

end