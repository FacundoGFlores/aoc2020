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

def calculate_2020_triplet(list)
  return [] unless list.size > 2

  first = list[0]
  rest = list[1..]
  pair = calculate_2020_pair(first, rest)
  return [first, pair[0], pair[1]] unless pair.empty?

  calculate_2020_triplet(rest)
end

def part2
  data = retrieve_data
  parsed_data = parse_data(data)
  triplet2020 = calculate_2020_triplet(parsed_data)
  result = triplet2020[0] * triplet2020[1] * triplet2020[2]
  puts result
end

part2
