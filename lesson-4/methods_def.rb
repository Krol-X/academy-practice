# frozen_string_literal: true

def index(filename)
  File.open filename, &:readlines
end

def find(filename, id)
  index(filename)[id - 1]
end

def where(filename, pattern)
  File.open filename do |file|
    file.each_line do |line|
      return line if line.match? pattern
    end
  end
  null
end

def update(filename, id, text)
  lines = index(filename)
  lines[id - 1] = text
  File.open(filename, 'w') do |file|
    file.write(lines.join)
  end
end

def delete(filename, id)
  lines = index(filename)
  lines.delete_at(id - 1)
  File.open(filename, 'w') do |file|
    file.write(lines.join)
  end
end

def create(filename, str)
  File.open(filename, 'a') do |file|
    file.write(str)
  end
end
