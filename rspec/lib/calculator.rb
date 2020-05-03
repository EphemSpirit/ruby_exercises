class Calculator

  def add(*nums)
    arr = Array.new(nums)
    arr.inject(&:+)
  end

  def multiply(*nums)
    arr = Array.new(nums)
    arr.inject(&:*)
  end
end
