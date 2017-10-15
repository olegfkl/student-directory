def read_self
File.open((__FILE__), "r" ) do |file|
  file.readlines.each do |line|
    puts line
  end
 end
end

read_self
