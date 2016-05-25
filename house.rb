class House
  DATA = [
    'line 1',
    'line 2',
    'line 3',
    'line 4',
    'line 5',
    'line 6',
    'line 7',
    'line 8',
    'line 9',
    'line 10',
    'line 11',
    'line 12',
  ]

  attr_reader :data, :formatter

  def initialize(orderer: DefaultOrderer.new, formatter: DefaultFormatter.new)
    @formatter = formatter
    @data      = orderer.order(DATA)
  end

  def recite
    (1..data.size).map { |i| line(i) }.join("\n")
  end

  def line(number)
    "This is #{phrase(number)}. \n"
  end

  def phrase(number)
    parts(number).join(" ")
  end

  def parts(number)
    formatter.format(data.last(number))
  end
end

class EchoFormatter
  def format(parts)
    parts.zip(parts).flatten
  end
end

class DefaultFormatter
  def format(parts)
    parts
  end
end

class RandomOrderer
  def order(data)
    data.shuffle
  end
end

class DefaultOrderer
  def order(data)
    data
  end
end