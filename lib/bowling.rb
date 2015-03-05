class Bowling

  def result rolls
    @tries = int_rolls(rolls)
    @tries = @tries.each_slice(2).to_a
    sum(@tries.each_with_index.map { |rolls, index|
      @index = index
      try_value rolls
    })
  end

  def int_rolls str
    chars = str.scan(/./)
    chars.each_with_index.map { |c, index|
      value_of chars, index
    }
  end

  def value_of chars, index
    return (10 - chars[index-1].to_i) if chars[index] == '/'
    return 10  if chars[index] == 'X'
    chars[index].to_i
  end

  def sum arr
    arr.inject(:+)
  end

  def try_value rolls
    if is_strike rolls
      10 + last_roll_value(-1) + last_roll_value(-2)
    elsif is_spare rolls
      10 + last_roll_value(-1)
    else
      sum rolls
    end
  end

  def is_strike rolls
    rolls[0] == 10
  end

  def is_spare rolls
    (sum rolls) >= 10
  end

  def last_roll_value ball
    return @tries[@index-1][ball] if @index > 0
    0
  end
end
