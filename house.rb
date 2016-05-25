class House
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
    data.last(number)
  end

  def data
    [
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
  end
end

class RandomHouse < House
  def data
    @data ||= super.shuffle
  end
end

class EchoHouse < House
  def parts(number)
    super.zip(super).flatten
  end
end