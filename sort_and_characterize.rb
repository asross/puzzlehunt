require 'csv'

@alphabet = [nil] + 'a'.upto('z').to_a

def cost(row)
  row[3].to_f
end

def name_number(row)
  characters = row[2].split("\n").first.downcase.gsub(/\W/, '')
  numbers = characters.split('').map{|c| @alphabet.index(c) }
  sum = numbers.inject(:+)
  sum % 26
end

rows = CSV.parse(File.read('./takeout.csv')).sort_by{|row| cost(row) }

characters = rows.map{|row| @alphabet[name_number(row)] }

puts characters.join
