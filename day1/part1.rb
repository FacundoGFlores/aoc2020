def retrieve_data
  file = File.open('input.txt')
  file_data = file.readlines.map(&:chomp)
  file.close
  file_data
end

def parse_data(list)
  list.map(&:to_i)
end

def calculate_2020_pair(pivot, list)
  return [] unless list.size > 1

  first = list[0]
  rest = list[1..]
  result = rest.select { |item| (item + first + pivot) == 2020 }
  return [first, result[0]] unless result.empty?

  calculate_2020_pair(pivot, rest)
end

def part1
  data = retrieve_data
  parsed_data = parse_data(data)
  pair2020 = calculate_2020_pair(parsed_data)
  result = pair2020[0] * pair2020[1]
  puts result
end

part1
