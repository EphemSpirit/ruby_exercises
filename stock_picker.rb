def picker stocks
  highest = 0
  buy = 0
  sell = 0
  stocks.each do |price|
    for day in stocks.index(price)..stocks.size-1 do
      margin = stocks[day] - price
      if margin > highest
        highest = margin
        buy = stocks.index(price)
        sell = day
      end
    end
  end
  puts "#{buy} #{sell}"
end

picker([17,3,6,9,15,8,6,1,10])
