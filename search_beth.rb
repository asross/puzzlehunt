require 'csv'
require 'pry'
require 'set'

graph = {}

rows = CSV.parse(File.read('./bethdata4.csv'), headers: true)

rows.each do |row|
  graph[row['Page #']] = row['Possible Doors'].split(',')
end
graph['24'] = []

visited = Set.new
frontier = [ ['1', ['1']] ]

while state = frontier.pop
  room, path = state

  if room == '24' && path.size == 24
    @path = path
    break
  end

  graph[room].each do |following_room|
    unless path.include?(following_room)
      frontier << [following_room, (path+[following_room])]
    end
  end
end

# ["1", "11", "4", "3", "8", "6", "17", "19", "15", "12", "23", "10", "16", "5", "2", "9", "18", "20", "21", "22", "13", "14", "7", "24"]
rows = rows.to_a[1..-1]

row_hash = rows.each_with_object({}) do |row, h|
  h[row[0]] = row
end

s = ''
@path.each_with_index do |this_room, i|
  if next_room = @path[i+1]
    doors = row_hash[this_room][2].split(',')
    index = doors.index(next_room)
    s += row_hash[this_room][5].to_s[index] || '_'
  end
end

puts s


binding.pry
