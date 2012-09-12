 a = [1,5,2,111,324,3,345,23,56,12,65,998,654,334,236,234,54,1024,873,681,223]
 b = [324,444,9,1024,3,345,23,78,123]
 c = []
 puts "Let's say we have 2 arrays"
 puts "a = #{a.to_s}"
 puts "b = #{b.to_s}"
 puts "Now we need to create array 'c' with elements from 'a' that do not exist in 'b'"
 puts "#1: a - b"
 puts "c = #{(a-b).sort.to_s}"
 puts "#2: more complex way"
 puts "1. sort both arrays asc"
 a.sort!
 b.sort!
 ela = a.first
 elb = b.first
 puts "2. start to loop for elements"
 finished = false
 until finished do	
 	if ela < elb
 		c << ela
 		ela = a[a.index(ela)+1]
 	end
 	elb = b[b.index(elb)+1] if ela > elb
 	if ela == elb
 		ela = a[a.index(ela)+1]
 		elb = b[b.index(elb)+1]
 	end
	finished = true if ela.nil? || a.size == a.index(ela)+1
 end
 puts "3. finished with result: "
 puts "c = #{c.to_s}"