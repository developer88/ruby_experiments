# coding: utf-8
require './parser'
puts "Trying to get 5 latest news from lenta.ru"
parser = Parser.new(5, :lentaru)
items = parser.parse
Parser.display(items)
