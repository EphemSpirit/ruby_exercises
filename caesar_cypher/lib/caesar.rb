def cipher str, factor
  str.chars.map(&:ord).map do |i|
    if i.between?(65, 90)
      ((i - 65 + factor) % 26) + 65
    elsif i.between?(97, 122)
      ((i - 97 + factor) % 26) + 97
    else
      i
    end
  end.map(&:chr).join
end

puts cipher "What a string!", 5
