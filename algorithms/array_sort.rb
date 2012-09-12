a = [6,3,124,666,1024,2,5,901,7,572,723,890,56,23,42,123]
def render_result(arr)
	puts "Result: a = #{arr} with size #{arr.size}"
end
puts "Given we have a = #{a} with size = #{a.size}"
#========================
puts "#1 Merge sort"
b = a.clone
def merge_sort(arr)
	return arr if arr.size < 2
	suba = []
	subb = []
	result = []
	delim = ((arr.size) / 2).to_i
	0.upto(delim-1){|i| suba << arr[i]}
	delim.upto(arr.size-1){|i| subb << arr[i]}
	suba = merge_sort(suba)
	subb = merge_sort(subb)
	while (!suba.nil? && suba.size > 0) || (!subb.nil? && subb.size > 0)
		if !suba.nil? && !subb.nil? && suba.size > 0 && subb.size > 0
			if suba.first < subb.first
				result << suba.first
				suba = suba.slice(1..suba.size-1)
			else
				result << subb.first
				subb = subb.slice(1..subb.size-1)
			end
		elsif !suba.nil? && suba.size > 0
			result << suba.first
			suba = suba.slice(1..suba.size-1)
		elsif !subb.nil? && subb.size > 0
			result << subb.first
			subb = subb.slice(1..subb.size-1)
		end
	end
	return result
end
render_result(merge_sort(b))
#========================
puts "#2 Selection sort"
b = a.clone
for i in 0..b.size-2
	min = i
	for j in (i+1)..(b.size-1)
		min = j if b[j] < b[min]
	end
	if min != i
		temp = b[i]
		b[i] = b[min]
		b[min] = temp
	end
end
render_result(b)
#========================
puts "#3 Insert sort"
b = a.clone
for i in 1..(b.size-1)
	item = b[i]
	pos = i
	while pos > 0 && b[pos-1] > item
		b[pos] = b[pos-1]
		pos -= 1
	end
	b[pos] = item
end
render_result(b)
#========================
puts "#4 Bubble sort"
b = a.clone
loop do
	finished = true
	for i in 1..(b.size-1)
		if b[i-1] > b[i]
			temp = b[i-1]
			b[i-1] = b[i]
			b[i] = temp
			finished = false
		end
	end
	break if finished == true
end 
render_result(b)