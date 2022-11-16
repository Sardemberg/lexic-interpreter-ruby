require_relative 'operations/line_analisys'

file = File.open('file.txt')

lines = file.readlines

lines.each.with_index do |line, index|
  next if line == "\n"

  Operations::LineAnalisys.new(line, index + 1).process
end
