example = lambda { puts "=====================\n\n" } # old syntax
text = ->(t){ puts "Let's say we have a text '#{t}'." } # 1.9 syntax
action = ->(a){ puts "I'd like to get '#{a}'"} # 1.9 syntax
result = lambda {|r,regex| puts "and result is '#{r}' with regex '#{regex}'" } # old syntax 

puts "Working with regex"
puts "====="

TEXT1 = "My syster's adress is Moscow, Russia at Lenina st. 21."
TEXT2 = "That is more complex text\n that the previous one\n\r because of special characters."
TEXT3 = "Just <b>an ordinary</b> html markup with 
         <div style='text-decoration:none;'>phone number <a href='#'>+7 987 744-3322</a></div>
          and <span class='email'><a href='emailto:someemail@smth.com'>email</a></span> and 
         a <ul><li><a onclick='alert(1);return false;' href='#'>link to www.goole.com 
         and http://eremin.me</a></li></ul>"
TEXT4 = "http://www.google.com"
TEXT5 = "steve@bulmer.com"

#TEXT 1

text.call(TEXT1)

action.call("number of syster's house e.g 21")
result.call(TEXT1.match(/\d+/),"/\d+/")
action.call("full address without any other text, e.g Moscow, Russia, Lenina 21")
result1 = TEXT1.match(/(?<city>\w+)\S\s(?<country>\w+)\sat\s(?<street>\w+)\sst\D+(?<house>\d+)\.$/)
result.call("#{result1[:city]}, #{result1[:country]}, #{result1[:street]} #{result1[:house]}","/(?<city>\w+)\S\s(?<country>\w+)\sat\s(?<street>\w+)\sst\D+(?<house>\d+)\.$/")
action.call("get all 's' count e.g. 10")
result.call(TEXT1.scan(/[s]/).size,"/[s]/")
action.call("replace 'i' with 'M'")
result.call(TEXT1.gsub(/i/,"M"),"/i/")

#TEXT 2

example.call
text.call(TEXT2)

action.call("the second line")

#TEXT 3

example.call
text.call(TEXT3)

action.call("get all link's tags")
result.call(TEXT3.scan(/<a.+a>/),"/<a.+a>/")
action.call("get all link's content")
result.call(TEXT3.scan(/<a.+>(.*)<\/a>/),"/<a.+>(.*)<\/a>/")
action.call("get onclick content")
result.call(/(onclick=)(?<onclick>'.+')[\s]/.match(TEXT3)[:onclick],"/(onclick=)(?<onclick>'.+')[\s]/")
action.call("get all html objects with 'email' class")
action.call("find a phone number")
action.call("find an email")
action.call("removed 'style' params")

#TEXT 4

example.call
text.call(TEXT4)

action.call("http")
result.call(TEXT4[/^[^:]+/],"/^[^:]+/")
action.call("delete http://")
result.call(TEXT4.gsub(/^.+[\/]+/,""),"/^.+[\/]+/")
action.call("remove www")
result.call(TEXT4.gsub(/[w]{3}\./,""),"/[w]{3}\./")
action.call("site name e.g. google")
result.call(TEXT4.match(/\.(\w*)\./)[1],"/\.(\w*)\./")
action.call("domain")
result.call(TEXT4.match(/\w+$/),"/\w+$/")

#TEXT 5

example.call
text.call(TEXT5)

action.call("everything before '@'")
result.call(TEXT5.match(/^\w+/),"/^\w+/")
result.call(TEXT5.match(/^.?[^@]+/),"/^.?[^@]+/")
action.call("everything after '@'")
result.call(TEXT5.match(/[^@]+$/),"/[^@]+$/")
action.call("domain")
result.call(TEXT5[/[^\.]+$/],"/[^\.]+$/")

