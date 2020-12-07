def retrieve_data
  file = File.open('input.txt')
  file_data = file.readlines.map(&:chomp)
  file.close
  file_data
end

def parse_data(list)
  list.map do |item|
    policy_builder = item.match(/(^\d*)-(\d*) (\w): (\w*)/)
    {
      valid_pos: policy_builder[1].to_i - 1,
      invalid_pos: policy_builder[2].to_i - 1,
      symbol: policy_builder[3],
      password: policy_builder[4]
    }
  end
end

def policy_checker(policy)
  (policy[:password][policy[:valid_pos]] == policy[:symbol] && policy[:password][policy[:invalid_pos]] != policy[:symbol]) || (policy[:password][policy[:valid_pos]] != policy[:symbol] && policy[:password][policy[:invalid_pos]] == policy[:symbol])
end

def filter_passwords(list)
  list.select { |policy| policy_checker(policy) }
end

def part2
  data = retrieve_data
  parsed_data = parse_data(data)
  result = filter_passwords(parsed_data)
  puts result.size
end

part2
