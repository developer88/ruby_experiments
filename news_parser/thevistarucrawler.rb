# coding: utf-8
require './crawler'
class TheVistaRuCrawler < Crawler

	def initialize(count)
		@url = "'http://www.thevista.ru/rss.php'"
		super
	end

	def parse_item(url, date, title)
		return nil if url.size == 0
		doc = Nokogiri::HTML(open(url))		
		text = doc.search("div#hypercontext").inner_html
		collect_item(url, title, date, text)
	end

end