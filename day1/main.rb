def getData()
  file = File.open("input.txt")
  file_data = file.readlines.map(&:chomp)
  file.close
  return file_data
end

def parseData(list)
  list.map(&:to_i)
end

def get2020(list)
  return [] unless list.size() > 1
  first = list[0]
  rest = list[1..-1]
  result = rest.filter {|item| (item + first) == 2020}
  return [first, result[0]] unless result.size() == 0
  get2020(rest)
end

def day1()
  data = getData()
  parsedData = parseData(data)
  pair2020 = get2020(parsedData)
  result = pair2020[0] * pair2020[1]
  puts result
end

day1()