# coding: utf-8
require "./lentacrawler.rb"
require "./thevistarucrawler.rb"
require './crawler'
class Parser

	def initialize(news_count = 5)
		@news_count = news_count
	end

	def parse
		#crawler = LentaCrawler.new
		#'http://lenta.ru/rss/'
		crawler = TheVistaRuCrawler.new
		return crawler.crawl_for_items(@news_count, "'http://www.thevista.ru/rss.php'")
	end

	def self.display(items)
		raise "Empty items array" unless items.is_a?(Array)
		puts "Found: #{items.size} news"
		puts "---------------"
		items.each_with_index do |news, index|
			puts "News ##{index+1}: #{news.title}"
			puts "#{news.url}"
			puts "#{news.date}"
			puts "=="
			puts "#{news.text}"
			puts "=="
		end
	end
end