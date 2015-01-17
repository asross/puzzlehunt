require 'csv'
require 'pry'
require 'set'

graph = {}

rows = CSV.parse(File.read('./bethdata.csv'), headers: true)

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

binding.pry
