def substrings(string, dict)
  hash = {}
  words = string.split(" ")
  words.each do { |word|
    dictionary.each do { |substring|
      if word.include? substring
        hash[substring].nil? ? hash[substring] = 1 : hash[substring] += 1
      end
    }
  }
  puts substrings
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
string = "Howdy partner, sit down! How's it going?"
