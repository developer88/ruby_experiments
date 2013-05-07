# coding: utf-8
require "./lentacrawler.rb"
require "./thevistarucrawler.rb"
require './crawler'
class Parser
	@news_count = 5
	@crawler = ""

	def initialize(news_count, parser)
		raise "Undefined news count variable" unless news_count.to_i > 0
		raise "Undefined parser variable" if parser.size == 0
		@news_count = news_count
		@crawler = crawler(parser)
		raise "Parser not found" unless @crawler 
	end

	def parse
		crawler = Object::const_get(@crawler).new(@news_count)
		return crawler.crawl_for_items
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

    private

    def crawler(parser_sym)
    	crawlers = {thevistaru:"TheVistaRuCrawler",lentaru:"LentaCrawler"}
    	crawlers[parser_sym.to_sym]
    end	

end