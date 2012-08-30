puts "-----------------------------------------------------------------"
puts "Script to find the longest database queries stored in rails db log file"
puts "open file"
queries_length=[]
queries = {}
query = ""
reading_header = false
counter = 0
time = 0.0
File.open("mysql-slow-queries.log", "r") do |infile|
    while (line = infile.gets)
    	if line.index("# Time:") || line.index("# User@Host:") || line.index("# Query_time:")
    		reading_header = true
    		if query != ""
    		  queries[time.strip] = query
    		end
    		query = ""
    		#get query's length
    		if line.index("# Query_time:")
    			line = line.gsub("# Query_time: ","")
    			space_index = line.index(" ")
    			time = line[0..space_index].to_f 
    			#puts "time = #{time}"    			
    		end
    	else
    		query += line
    	end        
        counter = counter + 1
    end
end
puts "row counters #{counter}"
puts "found queries #{queries.size}"
sorted_array = queries.sort {|x,y| y <=> x } 
i = 0
q = ""
while i < 10  do
   puts "============================="
   puts sorted_array[i]
   i +=1;
end