def divisible_by_5?(number)
  number % 5 == 0
end
def divisible_by_3?(number)
  number % 3 == 0
end
def divisible_by_3_and_5?(number)
  divisible_by_3?(number) && divisible_by_5?(number)
end

def print_appropriate_fizz_buzz(number)
  if divisible_by_3_and_5?(number)
    puts "FizzBuzz"
  elsif divisible_by_3?(number)
    puts "Fizz"
  elsif divisible_by_5?(number)
    puts "Buzz"
  else
    puts number
  end
end

(1..100).each do |counter|
  print_appropriate_fizz_buzz(counter)
end

