require 'open-uri'

url = "http://ruby.bastardsbook.com/files/fundamentals/hamlet.txt"
file_name = "hamlet.txt"
open(file_name, "w"){ |file| file.write(open(url).read) }

open(file_name, "r") do |file|
  file.readlines.each do |line|
    puts line if line.start_with?("Ham.")
  end
end
