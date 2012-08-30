# coding: utf-8
require './parser'
puts "Trying to get 5 latest news from thevista.ru"
parser = Parser.new(5)
items = parser.parse
Parser.display(items)
