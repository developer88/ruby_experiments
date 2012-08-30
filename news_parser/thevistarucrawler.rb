# coding: utf-8
require './crawler'
class TheVistaRuCrawler < Crawler

	def parse_item(url, date, title)
		return nil if url.size == 0
		doc = Nokogiri::HTML(open(url))		
		text = doc.search("div#hypercontext").inner_html
		collect_item(url, title, date, text)
	end

end