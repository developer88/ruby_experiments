example = lambda { puts "=====================\n\n" } # old syntax
text = ->(t){ puts "Let's say we have a text = '#{t}'." } # 1.9 syntax
action = ->(a){ puts "I'd like to get '#{a}':"}

puts "Working with regex"
puts "====="

TEXT1 = "My syster lives in Moscow, Russia at Lenina st. 21."
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






#TEXT 2

example.call

