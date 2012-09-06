# coding: utf-8
require './crawler'
class LentaCrawler  < Crawler
	
	def initialize(count)
		@url = 'http://lenta.ru/rss/'
		@fromencoding = "Windows-1251"
		@referer = "http://www.lenta.ru/"		
		super
	end

	def parse_item(url)
		return nil if url.size == 0
		url = "http://lenta.ru/news/2012/08/30/kvasha/"
		doc = Nokogiri::HTML(open(url))
		puts url
		#puts doc.css("td.statya").each do |td|
		#	td.inspect

			#puts i.inspect
		#end
		puts doc
		raise ""
	end
	
end